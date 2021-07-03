
class UsersController < ApplicationController
   
    def index
        users = User.all
        render json: users, status: 200
    end

    def show
        user = user_by_id(params[:id])
        if user
            render json: user, status: 200
        else
            render json: {message: "User is not found" }, status: 422
        end
    end

    def update
        # user = 
    end

    def users_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, food_ids: [], hobby_ids: [], foods_attributes: [:name])
    end

    def userfoods
        render json: "userfoods"
    end

    def userfood
        render json: "userfood"
    end

    private

    def user_by_id(id)
        user = User.find_by(id: id)
        if user.nil?
            user = User.find_by(username: id)
        end
        return user
    end
end
