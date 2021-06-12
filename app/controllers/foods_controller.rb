class FoodsController < ApplicationController

    def create 
        @food = Food.new(food_params)
        if @food.save 
            render json: {status:201, food: @food}
        else 
            render json: { status: 500, error: "*There was an error in creating your food." }
        end 
    end 
    
    def index 
        @foods = Food.all

        render json: { status: 201, foods: @foods }
    end 

    private 

    def food_params
        params.require(:food).permit(:name)
    end
end
