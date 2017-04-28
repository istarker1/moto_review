require 'rails_helper'

feature 'user votes' do
  scenario 'user votes on a review' do
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

    expect(page).to have_content("Score: 0")

    click_button "vote_button_up_#{review.id}"
    visit motorcycle_path(moto)

    expect(page).to have_content("Score: 1")
  end

  scenario 'user votes and then changes vote' do
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

    click_button "vote_button_up_#{review.id}"
    visit motorcycle_path(moto)
    click_button "vote_button_down_#{review.id}"
    visit motorcycle_path(moto)

    expect(page).to have_content("Score: -1")
  end

  scenario 'user votes and then deletes vote' do
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

    click_button "vote_button_down_#{review.id}"
    visit motorcycle_path(moto)
    expect(page).to have_content("Score: -1")
    click_button "vote_button_down_#{review.id}"
    visit motorcycle_path(moto)

    expect(page).to have_content("Score: 0")
  end
end
