class FaqpostsController < ApplicationController
    before_action :all_posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    before_action :set_posts, only: [:update, :edit, :destroy]
    before_action :require_editor, only: [:edit, :destroy, :new]

    def index
        @faqposts = Faqpost.all 
        respond_to do |format|
            format.js
            format.html
        end 
    end

    def new 
        @faqpost = Faqpost.new 
    end

    def create
        @faqpost = Faqpost.new(faqpost_params)
        @faqpost.faqpost_author ||= current_user.first_name
        @faqpost.faqpost_editor ||= current_user.first_name
        @faqpost.faqpost_body = @faqpost.faqpost_body.html_safe
        if @faqpost.save
            render 'index'
        else
            redirect_to '/error'
        end
    end

    def show
        render 'index'
    end

    def edit 
        @faqpost = Faqpost.find(params[:id])
    end

    def update
        @faqpost = Faqpost.find(params[:id])
        @faqpost_editor = current_user.first_name
        if @faqpost.update_attributes(faqpost_params)
            render 'index'
        else
            redirect_to '/error'
        end
    end

    def destroy 
        Faqpost.find(params[:id]).destroy
        redirect_to '/faqposts'
    end

    private
        def all_posts 
            @faqposts = Faqpost.all 
        end 

        def set_posts 
            @faqpost = Faqpost.find(params[:id])
        end 

        def faqpost_params
            params.require(:faqpost).permit(:faqpost_title, :faqpost_body, :faqpost_author)
        end


end
