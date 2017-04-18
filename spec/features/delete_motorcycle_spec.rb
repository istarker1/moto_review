require 'rails_helper'

feature 'delete motorcycle' do
  scenario 'user deletes a motorcycle' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    visit root_path
    expect(page).to have_content("Moto Guzzi V7 Stone")
    click_link 'Sign In'
    fill_in 'Email', with: 'jdoe@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit motorcycle_path(moto)
    click_link 'Delete Motorcycle'

    expect(page).to_not have_content("Moto Guzzi V7 Stone")
  end

  scenario 'other user cannot delete a motorcycle' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    visit root_path
    expect(page).to have_content("Moto Guzzi V7 Stone")
    visit motorcycle_path(moto)
    expect(page).to_not have_content("Delete Motorcycle")
  end

end
