class Auth::SignInService < ApplicationService
    attr_reader :username, :password

    def initialize(username, password)
        @username = username
        @password = password
    end

    def call
        begin
            user = User.find_by(username: @username)
            if user && user.authenticate(@password)
                payload = {}
                payload["user_id"] = user.id
                payload["exp"] = Rails.application.credentials.jwt[:expiration].to_i.hours.from_now.to_i
                token = JWT.encode(payload, Rails.application.credentials.jwt[:secret_key])
                return { 
                    token: token,
                    user: user
                }
            else
                raise StandardError.new "Failed to login"
            end
        rescue StandardError => e
            raise Auth::LogInFailedError.new(e)
        end
    end
end