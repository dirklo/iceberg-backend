class CompaniesController < ApplicationController
    def show #in progress 
        if current_user
            @company = Company.find_by_id(current_user.team.company_id) #something like this? intention: return show for only the company that current_user is associated with 
            render json: {status:201, company: @company}
        else 
            render json: { status: 500, error: "*You need to be logged in to access this data."}
        end
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
