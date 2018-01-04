require 'rails_helper'

RSpec.describe 'Users Features', type: :feature do

  context "create a new user" do

    before(:each) do
      visit new_user_registration_path
      within(:css, "form#new_user") do
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "password"
        fill_in "user_username", with: "test123"
        fill_in "user_key", with: Figaro.env.secret_registration_key
        page.attach_file("user_avatar", Rails.root + 'spec/support/images/test.jpg')
      #  fill_in "Avatar", with: { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'test.jpg'), 'image/jpeg') }
      end
    end

    scenario "Should be successfull" do

      within(:css, "form#new_user") do
        fill_in "user_email", with: "email@test.de"
      end

      click_button "Jetzt registrieren"

      expect(page).to have_content "Alle Reservierungen"
    end

    scenario "Should fail" do

      click_button "Jetzt registrieren"

      expect(page).to have_content 'E-Mail muss ausgefüllt werden'
    end

  end

  context "update user" do

    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

      scenario "should be successful", js: :true do


        visit edit_user_registration_path

        within(:css, "form#edit_user") do
          fill_in 'user_email', with: 'jane.doe@example.com'
          fill_in 'user_username', with: 'Bluster6000'
          fill_in "user_current_password", with: @user.password
        end

        click_button 'Update'
        expect(page).to have_content 'Ihre Daten wurden aktualisiert.'
        expect(page).to have_content 'Bluster6000'
      end

  end

  context 'destroy user' do

    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

      scenario "should be successful", js: :true do


        visit edit_user_registration_path

        accept_confirm do
          click_button 'Lösche meinen Account'
        end

        expect(page).to have_content 'Ihr Account wurde gelöscht.'
      end

  end


#Key muss akzeptiert werden
end
