FactoryBot.define do
  factory :food do
    food {Faker::Food.dish}
  end
end