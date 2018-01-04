require 'rails_helper'


RSpec.describe ReservationsController, type: :controller do

#  let(:user) {FactoryBot.create(:user)}

  context "normal request specs" do

    let(:user) {FactoryBot.create(:user_with_reservation)}
    #user = create(:user_with_reservation)

    describe 'controller should get root page' do
      it 'returns http success' do

        sign_in user
        get :index

        expect(response).to have_http_status(:success)
      end
    end

    describe 'get #show' do
      it 'returns http success' do

      #  create(:reservation, user: user)
        sign_in user
        get :show,  params: { id: user.to_param }

        expect(response).to be_success

      end
    end

    describe 'get #calendar' do
      it 'returns http success' do

        sign_in user
        get :calendar

        expect(response).to be_success

      end
    end

    describe "blocks unauthenticated access" do
      it 'should redirect to the new session path' do
        sign_in = nil
        get :new

        expect(response).to redirect_to new_user_session_path
      end
    end


  end


  context "when a user is logged in" do

    pending "there is need for additional controller tests"
  end


end
