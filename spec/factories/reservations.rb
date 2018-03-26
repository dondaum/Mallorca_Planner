require 'faker'

FactoryBot.define do

  factory :reservation do
    title 'First'
    start_date Date.today
    end_date   Date.today + 1.day
    comment 'Test 1'
    user
  end

  factory :random_reservation, class: Reservation do
   title Faker::Lorem.characters(5)
   start_date Faker::Date.between(20.days.ago, Date.today-1)
   end_date   Date.today
   comment Faker::Lorem.characters(10)
   user
 end

end
