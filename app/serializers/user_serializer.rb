class UserSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :first_name,
    :last_name,
    :username,
    :email,
    :jti,
    :admin,
    :image,
    :job_title,
    :pronoun
  )
  belongs_to :team
  has_many :hobbies
  has_many :foods
end
