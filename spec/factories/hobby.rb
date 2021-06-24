FactoryBot.define do
  factory :hobby do
    hobbyNames = ["Hobby1", "Hobby2", "Hobby3", "Hobby4"]
    hobbyname = hobbyNames.sample(1)
    name {hobbyname}
  end
end