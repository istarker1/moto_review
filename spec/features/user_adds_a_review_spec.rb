require 'rails_helper'

feature 'create review' do
  scenario 'user creates first review' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    review = FactoryGirl.build(:review)
    visit motorcycle_path(moto)
    login_as(user, :scope => :user)
    visit motorcycle_path(moto)
    click_link "Be the first to review!"
    fill_in 'Title', with: "#{review.title}"
    fill_in 'Review', with: "#{review.description}"
    click_button "Create Review"

    expect(page).to have_content("Moto Guzzi V7 Stone")
    expect(page).to have_content("Super awesome motorcycle!")
    expect(page).to have_content("Ian rides this motorcycle")
  end
end

# spec/features/user_adds_a_review_spec.rb
