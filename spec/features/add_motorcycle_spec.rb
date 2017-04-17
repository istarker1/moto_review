require 'rails_helper'

feature 'add a motorcycle' do
  scenario 'signed in user adds a motorcycle' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'jdoe@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Add a Motorcycle'
    fill_in "Make", with: "Ducati"
    fill_in "Model", with: "Panigale R"
    fill_in "CC", with: 1198
    select("Supersport", :from => "Style")
    click_on 'Create Motorcycle'

    expect(page).to have_content("Ducati Panigale R")
    expect(page).to have_content("CC: 1198")

  end
end
