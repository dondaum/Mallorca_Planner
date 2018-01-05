require 'rails_helper'

RSpec.feature "Reservation Features", type: :feature do

  context 'create a new reservation' do
    scenario 'should be successful' do

      user = FactoryBot.create(:user)
      sign_in user

      visit new_reservation_path
      within(:css, "form#new_reservation") do
        fill_in "reservation_title", with: "This is a title"
        fill_in "reservation_start_date", with: Date.today
        fill_in "reservation_end_date", with: Date.today + 10.days
        fill_in "reservation_comment", with: "This is a comment"
      end

      click_button "Speichern"

      expect(page).to have_content("Alle Reservierungen")
    end

    scenario 'should fail' do
      pending 'write scenario spec here'
    end
  end

  context 'update a reservation' do
    pending 'wirte update feature spec'
  end

  context 'destroy a reservation' do
    pending 'write destroy feature specs'
  end

end
