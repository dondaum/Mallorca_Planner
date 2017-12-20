require 'rails_helper'


RSpec.describe ReservationsController, type: :controller do

  let(:user) {FactoryBot.create(:user)}

  def fill_in_signin_fields
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
  end


  context 'controller should get index page' do
    it 'returns a success response' do
      expect(response).to be_success
    end
  end

  context 'controller should get show page for a reservation when user is autenticated' do
    it 'returns a success response' do
      fill_in_signin_fields
      reservation = Reservation.new(title: 'First',
                                    start_date: '2017-02-20',
                                    end_date:   '2017-03-01',
                                    comment:     'Test 1'

                                    ).save

      get :show, params: { id: reservation.to_param }
      expect(response).to be_success
    end
  end
end
