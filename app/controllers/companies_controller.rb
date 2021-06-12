class CompaniesController < ApplicationController
    def show 
        
        
    end

    def index 
        if current_user
            @companies = Company.all 
            render json: {status:201, companies: @companies}
        else 
            render json: {status:500, error: "*You need to be logged in to access this data."}
        end
    end
end
