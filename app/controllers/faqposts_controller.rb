class FaqpostsController < ApplicationController

    before_action :require_editor, only: [:edit, :destroy, :new]

    def index
        @faqposts = Faqpost.all 
    end

    def new 
        @faqpost = Faqpost.new 
        @helpfulstring = "The body of your post should go here. You may use basic HTML to markup your post. Use the key to the right for help"
        @bold = "<b> Bold </b>"
        @italics = "<i> Italics </i>"
        @underlined = "<u> Underline </u>"
        @br = "<br>"
        @hyperlink = "<a href=\"http://website.com\"> Texted to be linked </a> "
    end



    def create
        @faqpost = Faqpost.new(faqpost_params)
        @faqpost.faqpost_author ||= current_user
        @faqpost.faqpost_editor ||= current_user
        @faqpost.faqpost_body = @faqpost.faqpost_body.html_safe
        if @faqpost.save
            redirect_to '/faqposts'
        else
            redirect_to 'index'
        end
    end

    def show
        @faqpost = Faqpost.find(params[:id])
    end

    def edit 
        @faqpost = Faqpost.find(params[:id])
    end

    def update
        @faqpost = Faqpost.find(params[:id])
        @faqpost_editor = current_user
        if @faqpost.update_attributes(faqpost_params)
            redirect_to 'index'
        else
            redirect_to 'index'
        end
    end

    def destroy 
        Faqpost.find(params[:id]).destroy
        redirect_to '/faqposts'
    end

    private
        def faqpost_params
            params.require(:faqpost).permit(:faqpost_title, :faqpost_body, :faqpost_author)
        end


end
