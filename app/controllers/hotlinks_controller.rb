class HotlinksController < ApplicationController

    before_action :require_editor, only: [:new, :destroy]

    def new
        @hotlink = Hotlink.new
        respond_to do |format|
          format.js
        end 
    end 

    def create
        respond_to do |format|
            format.js 
        end 
        @hotlink = Hotlink.create!(hotlink_params)
    end 

    def destroy
        @hotlink = Hotlink.find(params[:id]).destroy 
        redirect_to '/sections'
    end 
    
    private 
        def hotlink_params
            params.require(:hotlink).permit(:title, :url)
        end 
end
