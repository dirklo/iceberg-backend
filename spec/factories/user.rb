FactoryBot.define do
  factory :user do
    hobbies =  FactoryBot.create_list(:hobby,2)
    firstname =  Faker::Name.first_name
    user { User.create(
      first_name: firstname,
      last_name: Faker::Name.last_name,
      username: firstname + "#{Faker::Number.number(digits: 2)}",
      password: Faker::Internet.password,
      email: Faker::Internet.email,
      team: Team.create(name: "Test"),
      hobbies: hobbies,
      foods: foods
      )}
  end
end