# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :draft_order do
    round 1
    pick 1
    team_id 1
  end
end
