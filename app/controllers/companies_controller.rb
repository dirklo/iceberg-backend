class CompaniesController < ApplicationController
    

    def show #in progress 
        @company = Company.find_by_id(current_user.team.company_id) #something like this? intention: return show for only the company that current_user is associated with 
        render json: {status:201, company: @company}
    end

    def index 
        @companies = Company.all 
        render json: {status:201, companies: @companies}
    end
end
