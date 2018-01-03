require 'rails_helper'


RSpec.describe ReservationsController, type: :controller do

#  let(:user) {FactoryBot.create(:user)}

  context "normal request specs" do

    let(:user) {FactoryBot.create(:user)}


    describe 'controller should get root page' do
      it 'returns http success' do

        sign_in user
        get :index

        expect(response).to have_http_status(:success)
      end

    end
  end


  context "when a user is logged in" do

    pending "there is need for additional controller tests"
  end


end
