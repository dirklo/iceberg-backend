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

    def show
        food = Food.find_by(id: params[:id])
        if food
            render json: food, status: 200
        else
            render json: {message: "Food is not found"}, status: 422
        end
    end

    def destroy
        food = Food.find_by(id: params[:id])
        food.destroy
        render json: "", status: 204
    end

    private 

    def food_params
        params.require(:food).permit(:name)
    end
end
