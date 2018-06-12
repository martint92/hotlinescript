class ReferralsController < ApplicationController
    include ReferralsHelper
    before_action :require_editor, only: [:new, :create, :edit, :update, :destroy]
    before_action :require_user 

    def index
        @referrals = Referral.where(category: "Immigration Legal")
        @referral = Referral.order(:priority).first  
        @reminder = Reminder.first 
        session[:category] = "Immigration Legal"
        adjust_session(@referral)
        respond_to(:js, :html)
    end 

    def fetch_category
        @referrals = Referral.where(category: params[:option]).order(:priority)
        session[:category] = params[:option]
        @referral = @referrals.first 
        adjust_session(@referral)
        respond_to :js 
    end 

    def fetch_content
        @referrals = Referral.where(category: session[:category]).order(:priority)
        @referral = Referral.find(params[:follow_id])
        adjust_session(@referral)
        respond_to :js 
    end 

    def new
        @referral = Referral.new 
        respond_to :js
    end 

    def create 
        @referral = Referral.create(referral_params)
        respond_to :js 
    end 

    def edit 
        @referral = Referral.find(params[:id])
        respond_to :js 
    end 

    def update
        @referral = Referral.find(params[:id])
        @referral.update_attributes(referral_params)
        respond_to :js 
    end 

    def destroy 
        @referral = Referral.find(params[:id]).destroy 
        respond_to :js 
    end 

    private 
        def referral_params
            params.require(:referral).permit(
                :category, :title, :body,
                ref_subs_attributes: [:id, :title, :body, :_destroy])
        end 

        def adjust_session(ref)
            return session[:ref_page] = 0 if ref.nil? 
            return session[:ref_page] = ref.id if ref.id.is_a? Integer
        end
end