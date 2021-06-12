class User < ApplicationRecord
    belongs_to :team
    has_many :users_foods
    has_many :users_hobbies
    has_many :foods, through: :users_foods
    has_many :hobbies, through: :users_hobbies
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
end
