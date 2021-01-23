class Auth::LogInService < ApplicationService
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
                expiration = Rails.application.credentials.jwt[:expiration].to_i.hours.from_now.to_i
                payload["exp"] = expiration
                token = JWT.encode(payload, Rails.application.credentials.jwt[:secret_key])
                return { 
                    token: token,
                    expiration: expiration 
                }
            else
                raise StandardError.new "Failed to login"
            end
        rescue StandardError => e
            raise Auth::LogInFailedError.new(e)
        end
    end
end