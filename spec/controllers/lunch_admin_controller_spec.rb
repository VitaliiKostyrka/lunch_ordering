require 'rails_helper'

RSpec.describe LunchAdminController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  it 'GET #index' do
    sign_in user
    get :index
    expect(response).to have_http_status(200)
  end
end
