require 'rails_helper'

RSpec.describe Reservation, type: :model do


  context 'validation tests' do
      subject { FactoryBot.create(:reservation)}


    it 'ensures title presence' do
      subject.title = nil

      expect(subject).to_not be_valid
    end

    it 'ensures start date presence' do
      subject.start_date = nil

      expect(subject).to_not be_valid
    end

    it 'ensures that start date is before end date' do
      subject.end_date = Date.today - 1.day

      expect(subject).to_not be_valid
    end

    it 'ensures end date presence' do
      subject.end_date = nil

      expect(subject).to_not be_valid
    end

    it 'should save successfully' do

      expect(subject).to be_valid
    end
  end

  context 'reservation scope testing' do
    let(:user)  { create(:user) }
    let(:reservation_new) { create(:reservation, created_at: Date.today-5 , user: user ) }
    let(:reservation_old) { create(:reservation, created_at: Date.today-10, user: user  ) }

      it 'sorts the reservation in a descending order' do

        expect(Reservation.order_descending).to match_array([reservation_new,reservation_old])
      end
  end
end
