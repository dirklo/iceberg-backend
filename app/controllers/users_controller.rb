class UsersController < ApplicationController
<<<<<<< HEAD
       
=======

    def index
        users = User.all
        render json: users
    end

    def users_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, food_ids: [], hobby_ids: [], foods_attributes: [:name])
    end
>>>>>>> b5c90fab3f33e054d44bd219c434ccceb72c76d9
end
