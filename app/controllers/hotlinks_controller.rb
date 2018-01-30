class HotlinksController < ApplicationController

    before_action :require_editor, only: [:new, :edit]

    def new
        @hotlink = Hotlink.new
        respond_to do |format|
            format.js
          end 
    end 

    def create
        @hotlink = Hotlink.create!(hotlink_params)
        redirect_to '/sections'
    end 

    def edit 
        @hotlink = Hotlink.find(params[:id])
        respond_to do |format|
            format.js
          end 
    end 

    def update
        @hotlink = Hotlink.find(params[:id])
        @hotlink.update_attributes(hotlink_params)
        redirect_to '/sections'
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
