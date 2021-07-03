FactoryBot.define do
  factory :team do
    name {Faker::Team.name}
    company_id { create(:company).id }
  end
end