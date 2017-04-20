require 'rails_helper'

feature 'create review' do
  scenario 'user creates first review' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    review = FactoryGirl.build(:review)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit motorcycle_path(moto)
    click_link "Be the first to review!"

    fill_in 'Title', with: review.title
    fill_in 'review_description', with: review.description # won't find label
    click_button "Create Review"

    expect(page).to have_content("Moto Guzzi V7 Stone")
    expect(page).to have_content("Super awesome motorcycle!")
    expect(page).to have_content("Ian rides this motorcycle")
  end
end

# spec/features/user_adds_a_review_spec.rb
