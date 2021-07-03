class HobbiesController < ApplicationController

    def create 
        @hobby = Hobby.new(hobby_params)
        if @hobby.save 
            render json: @hobby, status: 201
        else 
            render json: { status: 500, error: "*There was an error in submitting your hobby."}
        end 
    end 
    
    def index 
        @hobbies = Hobby.all
        render json: @hobbies, status: 200
    end 

    def show
        hobby = Hobby.find_by(id: params[:id])
        if hobby
            render json: hobby, status: 200
        else
            render json: {message: "Hobby is not found"}, status: 422
        end
    end

    def destroy
        hobby = Hobby.find_by(id: params[:id])
        hobby.destroy
        render json: "", status: 204
    end

    private 

    def hobby_params
        params.require(:hobby).permit(:name)
    end
end
