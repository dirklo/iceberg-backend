class UserSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :first_name,
    :last_name,
    :username,
    :email,
    :job_title,
    :image,
    :pronoun,
    :admin,
    :team_id,
  )
end
