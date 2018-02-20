class StaticController < ApplicationController
    def maintenance
    end

    def permission_error
        respond_to do |format|
            format.js
            format.html
        end 
    end

    def tracking
    end 

    def help
    end 

    def referrals
    end 

    def home
    end
end
