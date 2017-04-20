require 'rails_helper'

feature 'add a motorcycle' do
  scenario 'signed in user adds a motorcycle' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Add a Motorcycle'
    fill_in "Make", with: "Moto Guzzi"
    fill_in "Model", with: "V7 Stone"
    fill_in "CC", with: 744
    select("Retro", :from => "Style")
    click_on 'Create Motorcycle'

    expect(page).to have_content("Moto Guzzi V7 Stone")
    expect(page).to have_content("CC: 744")
    expect(page).to have_content("Style: Retro")

  end
end
