class AccountsController < ApplicationController
    
    def signup
        sign_up_form = SignUpForm.new
        render json: sign_up_form.submit(User.new(user_params), Company.new(company_parms))
    end

    private

    def company_parms
        params.require(:company).permit(:name)
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
