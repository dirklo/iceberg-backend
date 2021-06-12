class Hobby < ApplicationRecord
    has_many :users_hobbies
    has_many :users, through: :users_hobbies
end
