FactoryBot.define do
  factory :hobby do
    name {Faker::Hobby.activity}
  end
end