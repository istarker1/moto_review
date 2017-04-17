require 'rails_helper'

feature 'edit a motorcycle' do
  scenario 'signed in user edits a motorcycle' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'jdoe@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Moto Guzzi V7 Stone'
    click_link 'Edit Motorcycle'

    expect(page).to have_content("Edit Moto Guzzi V7 Stone")
    expect(page).to have_content("Cancel Edit")

  end

  scenario 'another user cannot edit a motorcycle' do
    user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user, email: 'n00bhaxxor@example.com', username: 'Chad')
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: other_user.email
    fill_in 'Password', with: other_user.password
    click_button 'Log in'
    click_link 'Moto Guzzi V7 Stone'

    expect(page).to_not have_content("Edit Motorcycle")

    visit "#{moto.id}/edit"
    expect(page).to have_content("Add a Motorcycle")

  end
end
