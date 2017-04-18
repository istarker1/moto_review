require 'rails_helper'

feature 'show motorcycle' do
  scenario 'user sees a motorcycle details' do
    user = FactoryGirl.create(:user)
    style = FactoryGirl.create(:style)
    moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
    visit motorcycle_path(moto)

    expect(page).to have_content("Moto Guzzi V7 Stone")
    expect(page).to have_content("CC: 744")
    expect(page).to have_content("Style: Retro")
  end
end
