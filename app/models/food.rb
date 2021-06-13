class Food < ApplicationRecord
    has_many :users_foods
    has_many :users, through: :users_foods
    validates :name, presence: :true, uniqueness: true
end
