class AccountsController < ApplicationController
    
    def signup
        render json: { message: 'successfully connected'}
    end

end
