class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  include Devise::JWT::RevocationStrategies::JTIMatcher
  belongs_to :team
  has_many :users_foods, dependent: :delete_all
  has_many :users_hobbies
  has_many :foods, through: :users_foods
  has_many :hobbies, through: :users_hobbies
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  # validates :password, presence: true   # We might remove this, if we use has_secure_password for bcrypt
end
