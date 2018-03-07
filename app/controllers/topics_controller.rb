class TopicsController < ApplicationController

    before_action :require_editor, only: [:new, :create, :edit, :update, :destroy]
    before_action :require_user 

    def index
        @topics = Topic.order(:priority).all 
        @selected ||= Topic.first 
        @hotlinks = Hotlink.all 
        respond_to(:js, :html)
    end 

    def from_nav
        @selected = Topic.find_by id: params[:topic_id]
        respond_to(:js)
    end 

    def new 
        @topic = Topic.new 
        respond_to(:js) 
    end 

    def create 
        @topic = Topic.create(topic_params)
        @selected = Topic.last
        @topics = Topic.order(:priority).all 
        respond_to(:js)
    end 

    def edit 
        @topic = Topic.find(params[:id])
        respond_to(:js)
    end 

    def update 
        @topic = Topic.find(params[:id])
        @topic.update_attributes(topic_params)
        @selected = @topic 
        @topics = Topic.order(:priority).all 
        respond_to(:js)
    end 

    def destroy
        @topic = Topic.find(params[:id]).destroy 
        @topics = Topic.order(:priority).all 
        redirect_to '/hotline' 
    end 

    private 
        def topic_params
            params.require(:topic).permit(:title)
        end 
end
