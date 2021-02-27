class Auth::SignInService < ApplicationService
    attr_reader :username, :password

    def initialize(username, password)
        @username = username
        @password = password
    end

    def call
        begin
            user = Auth::User.find_by(username: username)
            if user && user.authenticate(password)
                # Check if email has been confirmed
                if user.email.blank?
                    email_confirmation = user.user_email_confirmation
                    # Send another email in case they didn't get the first one
                    Auth::AccountsMailer.confirm_email(email_confirmation).deliver_now
                    raise Auth::EmailNotConfirmedError.new(nil)
                end
                payload = {}
                payload["user_id"] = user.id
                payload["exp"] = Rails.application.credentials.jwt[:expiration].to_i.hours.from_now.to_i
                token = JWT.encode(payload, Rails.application.credentials.jwt[:secret_key])
                return {
                    token: token
                }
            else
                raise Auth::LogInFailedError.new(nil)
            end
        rescue StandardError => e
            unless e.is_a? BaseError
                raise Auth::LogInFailedError.new(e)
            end
            raise
        end
    end
end
