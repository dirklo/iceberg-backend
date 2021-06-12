class HobbiesController < ApplicationController
    def index 
        @hobbies = Hobby.all

        render json: { status: 201, hobbies: @hobbies }
    end 
end
