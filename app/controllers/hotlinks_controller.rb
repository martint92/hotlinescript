class HotlinksController < ApplicationController

    before_action :require_editor, only: [:new, :destroy]

    def new
        @hotlink = Hotlink.new
        respond_to do |format|
          format.js
          format.html
        end 
    end 

    def create
        respond_to do |format|
            format.js 
            format.html
        end 
        @hotlink = Hotlink.create!(hotlink_params)
        redirect_to '/topics'
    end 

    def destroy
        @hotlink = Hotlink.find(params[:id]).destroy 
        redirect_to '/topics'
    end 
    
    private 
        def hotlink_params
            params.require(:hotlink).permit(:title, :url)
        end 
end
