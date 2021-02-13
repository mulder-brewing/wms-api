class Auth::AccountsMailer < ApplicationMailer

    def confirm_email(email_confirmation)
        @email_confirmation = email_confirmation
        mail to: email_confirmation.email, subject: "Verify email for Mulder WMS"
    end
    
end 