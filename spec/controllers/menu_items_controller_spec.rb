require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do
  let!(:admin) { FactoryBot.create(:user) }
  let(:user) { FactoryBot.create(:user) }
  let(:params) { { menu_item: { name: 'name', price: 10, kind: 'soup' } } }

  it 'simple user failed create' do
    sign_in user
    expect do
      post :create, params: params
    end.to change { MenuItem.count }.by(0)
  end

  it 'admin failed create' do
    sign_in admin
    params[:menu_item][:name] = ''
    expect do
      post :create, params: params
    end.to change { MenuItem.count }.by(0)
  end

  it 'admin success create' do
    sign_in admin
    expect do
      post :create, params: params
    end.to change { MenuItem.count }.by(1)
  end
end
