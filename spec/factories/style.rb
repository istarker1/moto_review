FactoryGirl.define do
  factory :style do
    sequence(:style) {|n| "Retro#{n}" }
  end
end
