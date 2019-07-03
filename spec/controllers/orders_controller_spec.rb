require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:soup) { FactoryBot.create(:soup) }
  let(:drink) { FactoryBot.create(:drink) }

  before do
    sign_in user
  end

  let(:params) { { order: { soup: soup.id } } }

  context 'POST #create' do
    it 'success create' do
      expect do
        post :create, params: params
      end.to change { Order.count }.by(1)
    end

    it 'failed create' do
      params[:order][:soup] = drink.id
      expect do
        post :create, params: params
      end.to change { Order.count }.by(0)
    end
  end
end
