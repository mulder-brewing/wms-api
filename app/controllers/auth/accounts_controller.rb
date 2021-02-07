class Auth::AccountsController < ApplicationController
    
    def sign_up
        Auth::SignUpService.call(Company.new(company_parms), User.new(user_params), params[:email])
        head :ok
    end

    def sign_in
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
