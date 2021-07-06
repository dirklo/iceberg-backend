FactoryBot.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    username {first_name + "#{Faker::Number.number(digits: 2)}"}
    password {Faker::Internet.password}
    email {Faker::Internet.email}
    team_id { create(:team).id }
    foods { create_list(:food, 2) }
    hobbies { create_list(:hobby, 2) }
  end
end