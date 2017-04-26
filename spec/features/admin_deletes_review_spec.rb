require 'rails_helper'

feature 'admin delete review' do
  scenario 'admin deletes a review' do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:user, role: "admin")
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    review = FactoryGirl.create(:review, motorcycle_id: moto.id, user_id: user.id)
    visit root_path
    expect(page).to have_content("Moto Guzzi V7 Stone")
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit admin_motorcycle_path(moto)
    expect(page).to have_content("(ADMIN)")
    expect(page).to have_content("Reviews")
    expect(page).to have_content("Super awesome")
    click_link 'Delete review'

    expect(page).to have_content("(ADMIN)")
    expect(page).to_not have_content("Super awesome")

    visit motorcycle_path(moto)

    expect(page).to_not have_content("(ADMIN)")
    expect(page).to_not have_content("Super awesome")
    expect(page).to have_content("Be the first to review")
  end

end
