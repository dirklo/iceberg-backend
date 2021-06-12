company = Company.create(name: "First Company")
team1 = company.teams.create(name: "Human Resources")
team2 = company.teams.create(name: "Software")
team3 = company.teams.create(name: "Sales")
team4 = company.teams.create(name: "Customer Service")
team5 = company.teams.create(name: "Marketing")

team1.users.create(  # ADMIN USER =>> username: admin & password: admin123
    first_name: "Kayser",
    last_name: "Soze",
    username: "admin",
    password: "admin123", #password must be at least 6 characters
    email: "admin@admin.com",
    job_title: "HR Manager",
    pronoun: "he/him",
    admin: true
)

def populateUsers(teams)
    teams.map do |team|
        10.times do
            team.users.create(
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                username: (Faker::Name.first_name + "#{Faker::Number.number(digits: 2)}"),
                password: Faker::Internet.password,
                email: Faker::Internet.email,
                job_title: (team.name + Faker::Job.position),
                pronoun: Faker::Gender.type,
                admin: false
            )
        end
    end
end

populateUsers(Team.all) 

foods = []
25.times do
    foods.push(Food.create(name: Faker::Food.dish)) # Some food instances might have same name.
end

hobbyNames = ["Reading", "Drawing", "Listening Music", "Running", "Hiking", "Swimming", "Writing", "Soccer", "Basketball", "Traveling", "Cooking", "Fitness"]
hobbies = hobbyNames.map { |h| Hobby.create(name: h) }
User.all.map do |user| 
    user.foods = foods.sample(3) # Everyone gets 3 fav dishes for now
    user.hobbies = hobbies.sample(3) # Everyone gets 3 hobbies for now 
end