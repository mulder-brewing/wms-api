class ApplicationController < ActionController::API
    include ErrorHandler

    def auth_header
        request.headers["Authorization"]
    end
end
