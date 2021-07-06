class UsersfoodController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.foods, status: 200
  end

  def create
    @user = User.find(params[:user_id])
    addedFoods = []
    createdFood = []
    arr = params[:foods]
    if !arr.nil?
      arr.each do |food|
        @food = Food.find_by(name: food["name"])
        if @food == nil
          @food = Food.create(name: food["name"])
          createdFood << @food
        end
        if @user.foods.exists?(name: @food.name) == false
          @user.foods << @food
          addedFoods << @food
        end
      end
      render json: {added: addedFoods, created: createdFood}, status: 200
    else
      render json: {message: "No food was added"}, status: 422
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @userfood = @user.foods.find_by(id: params[:id])    
    if !@userfood.nil?
      @userfood.destroy
      render json: {message: "Delete successful"}, status: 204
    else
      render json: {message: "Delete unsuccessful"}, status: 404
    end
  end

end