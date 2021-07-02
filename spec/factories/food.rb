FactoryBot.define do
  factory :food do
    name {Faker::Food.dish}
  end
end