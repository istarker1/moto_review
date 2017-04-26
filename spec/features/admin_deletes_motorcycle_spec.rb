require 'rails_helper'

feature 'admin delete' do
  scenario 'admin deletes motorcycle' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle)
    second_moto = FactoryGirl.create(:motorcycle, make: "Ducati", model: "1299 Panigale")
    admin = FactoryGirl.create(:user, role: "admin")
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit "/admin/motorcycles"
    click_link "Moto Guzzi V7 Stone"
    click_link "Delete Motorcycle"

    expect(page).to have_content("Ducati 1299 Panigale")
    expect(page).to_not have_content("Moto Guzzi V7 Stone")

    visit root_path

    expect(page).to have_content("Ducati 1299 Panigale")
    expect(page).to_not have_content("Moto Guzzi V7 Stone")

  end
end

# spec/features/admin_deletes_motorcycle_spec.rb
