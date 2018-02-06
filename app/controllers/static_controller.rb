class StaticController < ApplicationController
    def maintenance
    end

    def permission_error
        respond_to do |format|
            format.js
            format.html
        end 
    end

    def help
        ScriptResourcesMailer.test_email(User.first).deliver_now 
    end 

    def home
    end
end
