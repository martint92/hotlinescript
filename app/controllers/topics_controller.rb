class TopicsController < ApplicationController
    include TopicsHelper 

    before_action :require_editor, only: [:new, :create, :edit, :update, :destroy]
    before_action :require_user 

    def index
        @topics = Topic.order(:priority).all 
        @selected ||= Topic.first 
        @hotlinks = Hotlink.all 
        respond_to(:js, :html)
        session[:last_topic] = @selected
    end 

    def from_nav
        @selected = Topic.find(params[:id])
        respond_to(:js)
        session[:last_topic] = @selected
    end 

    def new 
        @topic = Topic.new 
        respond_to(:js, :html)
    end 

    def create 
        @topic = Topic.create(topic_params)
        @selected = Topic.last
        @topics = Topic.order(:priority).all 
        respond_to(:js, :html)
        session[:last_topic] = @selected
        redirect_to '/topics'
    end 

    def edit 
        @topic = Topic.find(params[:id])
        respond_to(:js, :html)
    end 

    def update 
        @topic = Topic.find(params[:id])
        @topic.update_attributes(topic_params)
        @selected = @topic 
        @topics = Topic.order(:priority).all 
        respond_to(:js, :html)
        session[:last_topic] = @selected
    end 

    def destroy
        @topic = Topic.find(params[:id]).destroy 
        @topics = Topic.order(:priority).all 
        respond_to(:js, :html)
    end 

    private 
        def topic_params
            params.require(:topic).permit(:title)
        end 
end
