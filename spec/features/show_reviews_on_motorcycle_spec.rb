require 'rails_helper'

feature 'show review of motorcycle' do
  scenario 'user sees a motorcycle and its reviews' do

    moto = FactoryGirl.create(:motorcycle)
    review = FactoryGirl.create(:review, user_id: moto.user.id, motorcycle_id: moto.id)
    visit motorcycle_path(moto)

    expect(page).to have_content("Moto Guzzi V7 Stone")
    expect(page).to have_content("Super awesome motorcycle!")
    expect(page).to have_content("Ian rides this motorcycle")
  end
end

# spec/features/show_reviews_on_motorcycle_spec.rb
