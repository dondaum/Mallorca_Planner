require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject { Reservation.new(title: 'First', start_date: Date.today,
                                end_date:   Date.today + 1.day, comment: 'Test 1')

  }

  context 'validation tests' do
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

    it 'ensures comment presence' do
      subject.comment = nil

      expect(subject).to_not be_valid
    end

    it 'should save successfully' do

      expect(subject).to be_valid
    end
  end
end
