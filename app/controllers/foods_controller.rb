class FoodsController < ApplicationController
    def index 
        @foods = Food.all

        render json: { status: 201, foods: @foods }
    end 

end
