class UserMailer < ApplicationMailer
    def invite_email(user)
        @user = user 
        mail(to: user.email, subject: 'Welcome to the HILSC Hotline Team!')
    end 

    def password_reset(user)
        @user = user 
        mail(to: user.email, subject: "Password Reset")
    end 

end
