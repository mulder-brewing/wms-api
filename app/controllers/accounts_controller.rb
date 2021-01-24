class AccountsController < ApplicationController
    
    def signup
        Auth::SignUpService.call(Company.new(company_parms), User.new(user_params))
        head :ok
    end

    def signin
        render json: Auth::SignInService.call(params[:username], params[:password])
    end

    private

    def company_parms
        params.require(:company).permit(:name)
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
