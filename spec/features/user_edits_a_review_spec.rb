require 'rails_helper'

feature 'create review' do
  scenario 'user creates first review' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    review = FactoryGirl.create(:review, user_id: user.id, motorcycle_id: moto.id)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit motorcycle_path(moto)

    expect(page).to have_content("Super awesome motorcycle!")
    
    click_link "Edit your review"

    fill_in 'Title', with: "Super duper awesome ride"
    fill_in 'review_description', with: "EDIT: Ian rides this motorcycle" # won't find label
    click_button "Update Review"

    expect(page).to have_content("Moto Guzzi V7 Stone")
    expect(page).to have_content("Super duper awesome ride")
    expect(page).to_not have_content("Super awesome motorcycle!")
    expect(page).to have_content("EDIT: Ian rides this motorcycle")
  end
end

# spec/features/user_edits_a_review_spec.rb
