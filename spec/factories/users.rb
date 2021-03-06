require 'faker'

FactoryBot.define do

  factory :user do

    email "test@test2.com"
    username "test12"
    key Figaro.env.secret_registration_key
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'test.jpg'), 'image/jpeg') }
    password "test12345"
    password_confirmation "test12345"

    factory :user_with_reservation do
      after(:create) do |user|
        create(:reservation, user: user)
      end
    end

  end


 # not used the random user before. Does this Faker avatar image works?
  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    key Figaro.env.secret_registration_key
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'test.jpg'), 'image/jpeg') }
    username Faker::Hobbit.character
    password "testtest"
    password_confirmation "testtest"
  end

end
