class UsersfoodController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.foods, status: 200
  end

  def create    
    @user = User.find(params[:user_id])
    addedFoods = []
    createdFood = []
    #params has the ability to receive an array of foods to be added for this user
    arr = params[:foods]    
    if !arr.nil?
      # process each item received
      arr.each do |food|
        @food = Food.find_by(name: food["name"])
        # if food sent for adding is not currently in the database, create it, add it to createdFoods to be sent back to requestor.  createdFoods will signal to the requester that it's a new addition to the database and can be used to update the redux store
        if @food == nil
          @food = Food.create(name: food["name"])
          createdFood << @food
        end
        # check if the food is already associated with the user, if not, associate it with the user, add it to addedFoods to send back to requestor so redux store can be
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
    params[:id].split(",").each do |i|
      @userfood = @user.foods.find_by(id: i.to_i)
      @user.foods.delete(@userfood)
    end
    render json: {message: "Delete successful"}, status: 204
  end

end