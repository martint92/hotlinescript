class InstructionsController < ApplicationController
    before_action :require_admin, only: [:new, :create, :edit, :update]
    before_action :require_user 

    def index
        @instruction = Instruction.first 
    end 

    def new
        @instruction = Instruction.new 
    end 

    def create
        @instruction = Instruction.create(instruction_params) 
        redirect_to "/"
    end 

    def edit 
        @instruction = Instruction.find(1)
    end 

    def update 
        @instruction = Instruction.find(1)
        @instruction.update_attributes(instruction_params)
        redirect_to "/"
    end 

    private 
        def instruction_params
            params.require(:instruction).permit(:header, :body)
        end 
end