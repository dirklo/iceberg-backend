class TeamsController < ApplicationController
    # def create  
        #admin_user should be only one able to create team
    # end 

    def show 
        @current_users_team = Team.find_by_id(current_user.team_id) #current_user Devise helper method inaccessible here
        render json: { status:201, team: @current_users_team}
    end

    def index 
        @teams = Team.all  
        render json: {status:201, teams: @teams}
    end 
end
