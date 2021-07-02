FactoryBot.define do
  factory :hobby do
    name {Faker::String.random(length: 4)}
  end
end