require 'rails_helper'

feature 'admin show' do
  scenario 'admin views specific motorcycle' do
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
    expect(page).to have_content("Moto Guzzi V7 Stone")
    expect(page).to have_content("Ducati 1299 Panigale")
    click_link "Moto Guzzi V7 Stone"
    expect(page).to have_content("(ADMIN)")
    expect(page).to have_content("Moto Guzzi V7 Stone")
    expect(page).to have_content("Delete Motorcycle")
  end
end

# spec/features/admin_views_motorcycle_show_spec.rb
