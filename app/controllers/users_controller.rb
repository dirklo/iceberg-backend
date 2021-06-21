class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: params[:id])
        if user === nil
            # if username passed rather than user_id
            user = User.find_by(username: params[:id])
        end
        if user
            render json: user
        else
            render json: { status: 200, message: "User is not found" }
        end
    end

    def users_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, food_ids: [], hobby_ids: [], foods_attributes: [:name])
    end
end
