class FoodsController < ApplicationController

    def create 
        @food = Food.new(food_params)
        if @food.save 
            render json: @food, status: 201
        else 
            render json: { status: 500, error: "*There was an error in creating your food." }
        end 
    end 
    
    def index 
        @foods = Food.all
        render json: @foods, status: 200
    end 

    private 

    def food_params
        params.require(:food).permit(:name)
    end
end
