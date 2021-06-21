module MyHelper extends ActionController::Base 
  def user_by_id(id)
    user = User.find_by(id: id)
    if user.nil?
      user = User.find_by(username: id)
    end
  end
end