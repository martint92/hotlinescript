class RemindersController < ApplicationController
    before_action :require_editor, only: [:new, :create, :edit, :update, :destroy]
    before_action :require_user 

    def new
        @reminder = Reminder.new 
        respond_to :js 
    end 

    def create
        @reminder = Reminder.create(reminder_params)
        respond_to :js 
    end 

    def edit 
        @reminder = Reminder.find(params[:id])
        respond_to :js 
    end 

    def update 
        @reminder = Reminder.find(parmas[:id])
        @reminder.update_attributes(reminder_params)
        respond_to :js 
    end 

    private
        def reminder_params
            params.require(:reminder).permit(:title, :body)
        end 
end
