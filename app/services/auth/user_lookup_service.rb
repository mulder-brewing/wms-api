class Auth::UserLookupService < ApplicationService
    attr_reader :auth_header

    def initialize(auth_header)
        @auth_header = auth_header
    end

    def call
        begin
            # header: { 'Authorization': 'Bearer <token>' }
            token = auth_header.split(' ')[1]
            decoded_token = JWT.decode(token, Rails.application.credentials.jwt[:secret_key], true, algorithm: 'HS256')
            user_id = decoded_token[0]['user_id']
            user = User.find_by(id: user_id)
            raise StandardError.new "Failed to lookup user from auth header" unless !!user
            return user
        rescue StandardError => e
            raise Auth::PleaseLoginError.new(e)
        end
    end
end