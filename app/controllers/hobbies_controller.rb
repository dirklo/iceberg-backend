class HobbiesController < ApplicationController

    def create 
        @hobby = Hobby.new(hobby_params)
        if @hobby.save 
            render json: {status:201, hobby: @hobby}
        else 
            render json: { status: 500, error: "*There was an error in submitting your hobby."}
        end 
    end 
    
    def index 
        @hobbies = Hobby.all

        render json: { status: 201, hobbies: @hobbies }
    end 

    private 

    def hobby_params
        params.require(:hobby).permit(:name)
    end
end
