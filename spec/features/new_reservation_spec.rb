require 'rails_helper'

RSpec.feature "Create a new resevation", :type => :feature do

  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  scenario "Visitor gets from root path to new reservation path" do

    visit root_path
    first(:link, "Neue Reservierung").click

    expect(page).to have_text("Neue Reservierung für Mallorca speichern")
  end

  scenario "Visitor creates a new reservation" do

    visit new_reservation_path

    fill_in 'reservation_title', with: 'Das ist ein Titel'
    fill_in 'reservation_start_date', with: Date.today
    fill_in 'reservation_end_date', with: (Date.today + 1.day)
    fill_in 'reservation_comment', with: 'Wir freuen uns'

    #click_link 'Speichern'
    click_on('Speichern')

    #expect(page).to have_content ‘Success’
    expect(page).to have_text("Alle Reservierungen")

  end
end
