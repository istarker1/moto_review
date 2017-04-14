require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "create user" do
    it "creates a valid user" do
      user = User.create! do |u|
        u.first_name = "John"
        u.last_name = "Doe"
        u.username = "jondoe"
        u.email = "user@example.com"
        u.password = "password"
      end
      results = User.all

      expect(user.role).to eq("member")
      expect(results).to include(user)
    end

  end
end
