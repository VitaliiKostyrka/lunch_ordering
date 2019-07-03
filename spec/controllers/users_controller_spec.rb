require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  it '#index' do
    get :index
    expect(response).to have_http_status(200)
    expect(subject.current_user).to_not be_nil
  end

  context '#update' do
    let(:params) { { user: { name: 'newName', email: 'new@new.com' }, id: user.id } }

    it 'success update' do
      put :update, params: params

      user.reload
      expect(user.name).to eq('newName')
      expect(user.email).to eq('new@new.com')
      expect(response).to redirect_to(root_path)
    end

    it 'failed update' do
      params[:user][:name] = ''
      put :update, params: params

      user.reload
      expect(user.name).to_not eq('newName')
      expect(user.email).to_not eq('new@new.com')
      expect(response).to redirect_to(edit_user_path)
    end
  end
end
