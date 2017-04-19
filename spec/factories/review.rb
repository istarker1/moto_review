FactoryGirl.define do
  factory :review do
    title "Super awesome motorcycle!"
    description "Ian rides this motorcycle so it's automatically the best one ever made in the history of time"
    user_id 1
    motorcycle_id 1
  end
end
