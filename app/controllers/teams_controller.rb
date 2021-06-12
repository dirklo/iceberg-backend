class TeamsController < ApplicationController

    def create  
        #admin_user should be only one able to create team
    end 

    def show 
        #maybe see all users in a team 
    end

    def index 
        if current_user
            @teams = Team.all  
            render json: {status:201, teams: @teams}
        else 
            render json: { status: 500, error: "*You need to be logged in to access this data."}
        end 
    end 
end
