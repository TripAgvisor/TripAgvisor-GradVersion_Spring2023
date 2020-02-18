class PortalsController < ApplicationController
    def index
        @programs = Program.where(disabled: false)
        
        if logged_in?
            #if logged in and the user already has a program selected, then automatically go that program portal
            program = Program.find session[:user_program_id] unless session[:user_program_id].nil?
            if(not program.nil?) then
                redirect_to portal_path(program.id)
            end
        end
    end
    
    def program_select
        program = Program.find params[:program_id]
        if(program.nil?) then
            flash[:notice] = "Pogram not found!"
        else
            if logged_in?
                #save selected program to the user account so next time they don't have to select it
                user = User.find session[:user]
                if(not user.nil?) then
                    user.program_id = program.id
                    user.save
                    session[:user_program_id] = program.id
                end
            end
            redirect_to portal_path(program.id)
        end
    end
    
    
    def program_view
        program = Program.find params[:program_id]
        if(program.nil?) then
            flash[:notice] = "Pogram not found!"
        else
            session[:user_program_id] = program.id
            redirect_to portal_path(program.id)
        end
    end
    
    def view
        @program = Program.find params[:id]
        @programs = Program.where(disabled: false)
        @tips = Tip.left_outer_joins(:user).select("tips.*,users.name as user_name").where(tips: {program_id: params[:id]})
        # @tips = Tip.where(program_id: params[:id])
        @experiences = Experience.left_outer_joins(:user).select("experiences.*,users.name as user_name").where(experiences: {program_id: params[:id]})
        puts "OUTPUT HERE"
        @experiences.each do |exp|
            exp.comments = ExperienceComment.left_outer_joins(:user).select("experience_comments.*,users.name as user_name").where(experience_id: exp.id).order(created_at: :desc)
            puts exp.comments.size
        end
    end
end