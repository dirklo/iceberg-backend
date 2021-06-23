FactoryBot.define do
  factory :name do
    food {Faker::Food.dish}
  end
end