class UsershobbyController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.hobbies, status: 200
  end

  def create
    @user = User.find(params[:user_id])
    addedHobbies = []
    createdHobby = []
    arr = params[:hobbies]
    if !arr.nil?
      arr.each do |hobby|
        @hobby = Hobby.find_by(name: hobby["name"])
        if @hobby == nil
          @hobby = Hobby.create(name: hobby["name"])
          createdHobby << @hobby
        end
        if @user.hobbies.exists?(name: @hobby.name) == false
          @user.hobbies << @hobby
          addedHobbies << @hobby
        end
      end
      render json: {added: addedHobbies, created: createdHobby}, status: 200
    else
      render json: {message: "No hobby was added"}, status: 422
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @userhobby = @user.hobbies.find_by(id: params[:id])    
    if !@userhobby.nil?
      @userhobby.destroy
      render json: {message: "Delete successful"}, status: 204
    else
      render json: {message: "Delete unsuccessful"}, status: 404
    end
  end

end