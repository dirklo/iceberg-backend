class TeamsController < ApplicationController

    def create  
        #admin_user should be only one able to create team
    end 

    def show 
        if current_user
            @current_users_team = Team.find_by_id(current_user.team_id)
            render json: { status:201, team: @current_users_team}
        else 
            render json: { status: 500, error: "*No Team to display currently."}
        end
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
