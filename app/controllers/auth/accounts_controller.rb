class Auth::AccountsController < ApplicationController

    def sign_up
        Auth::SignUpService.call(Auth::Company.new(company_parms), Auth::User.new(user_params), params[:email])
        head :ok
    end

    def sign_in
        render json: Auth::SignInService.call(params[:username], params[:password])
    end

    def confirm_email
        Auth::ConfirmEmailService.call(params[:token])
        head :ok
    end

    private

    def company_parms
        params.require(:company).permit(:name)
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
