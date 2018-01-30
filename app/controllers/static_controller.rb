class StaticController < ApplicationController
    def maintenance
    end

    def permission_error
    respond_to do |format|
        format.js
        format.html
    end 
    end

    def contact
    end

    def harvey_faq
    end
    
    def doesnotexist
    end

    def help
    end 
    
    def home
    end
end
