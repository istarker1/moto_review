require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "create motorcycle" do

    it "creates a valid motorcycle" do
      user = FactoryGirl.create(:user)
      style = FactoryGirl.create(:style)
      FactoryGirl.build(:motorcycle, user_id: user.id, style_id: style.id).should be_valid
      moto = FactoryGirl.create(:motorcycle, user_id: user.id, style_id: style.id)
      results  = Motorcycle.all

      expect(results).to include(moto)
      expect(moto.make).to eq("Moto Guzzi")
      expect(moto.model).to eq("V7 Stone")
    end

    it "does not create an invalid motorcycle" do
      FactoryGirl.build(:motorcycle, :make => "").should_not be_valid
    end

  end
end
