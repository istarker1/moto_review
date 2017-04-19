require 'rails_helper'

RSpec.describe Review, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "create question" do

    it "creates a valid motorcycle" do
      user = FactoryGirl.create(:user)
      style = FactoryGirl.create(:style)
      moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
      review = FactoryGirl.create(:review, user_id: user.id, motorcycle_id: moto.id)
      results  = Review.all

      expect(results).to include(review)
      expect(review.title).to eq("Super awesome motorcycle!")
      expect(review.description).to eq("Ian rides this motorcycle so it's automatically the best one ever made in the history of time")
    end

    it "does not create an invalid review" do
      FactoryGirl.build(:review, :title => "").should_not be_valid
    end

  end
end
