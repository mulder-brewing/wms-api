class Auth::JwtController < ApplicationController
    
    def auth_check
        Auth::UserLookupService.call(auth_header)
        head :ok
    end

end