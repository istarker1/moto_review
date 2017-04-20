require 'rails_helper'

feature 'delete review' do
  scenario 'user deletes a review' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    review = FactoryGirl.create(:review, motorcycle_id: moto.id, user_id: user.id)
    visit root_path
    expect(page).to have_content("Moto Guzzi V7 Stone")
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit motorcycle_path(moto)
    expect(page).to have_content("Reviews")
    expect(page).to have_content("Super awesome")
    expect(page).to_not have_content("Be the first to review")
    click_link 'Delete your review'

    expect(page).to_not have_content("Reviews")
    expect(page).to_not have_content("Super awesome")
    expect(page).to have_content("Be the first to review")
  end

  scenario 'other user cannot delete a review' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    review = FactoryGirl.create(:review, motorcycle_id: moto.id, user_id: user.id)
    visit motorcycle_path(moto)
    expect(page).to_not have_link("Delete your review")
    expect(page).to have_link("Sign in to review")
  end

end

# spec/features/delete_review_spec.rb
