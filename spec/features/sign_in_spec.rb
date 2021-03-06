require 'rails_helper'

feature 'sign up' do
  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    fill_in 'Username', with: 'johndoe'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("Hello John!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'trying to sign in without required information' do
    visit root_path
    click_link 'Sign Up' # Don't fill in anything
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")

  end


end
