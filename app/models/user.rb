class User < ApplicationRecord
    belongs_to :team
    has_many :users_foods
    has_many :users_hobbies
    has_many :foods, through: :users_foods
    has_many :hobbies, through: :users_hobbies
end
