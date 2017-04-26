require 'rails_helper'

feature 'admin get' do
  scenario 'admin views motorcycles' do
    user = FactoryGirl.create(:user, role: "admin")
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit "/admin/motorcycles"

    expect(page).to have_content("All Motorcycles (ADMIN)")
    expect(page).to have_content("Moto Guzzi V7 Stone")
  end

  scenario 'user cannot view admin page' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit "/admin/motorcycles"

    expect(page).to have_content("You are not authorized")
    expect(page).to_not have_content("All Motorcycles (ADMIN)")
  end
  
end

# spec/features/admin_views_motorcycles_spec.rb
