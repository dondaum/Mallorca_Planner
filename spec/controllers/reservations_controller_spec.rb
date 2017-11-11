require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  context 'controller should get index page' do
    it 'returns a success response' do
      expect(response).to be_success
    end
  end

  context 'controller should get show page for a reservation' do
    it 'returns a success response' do
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
