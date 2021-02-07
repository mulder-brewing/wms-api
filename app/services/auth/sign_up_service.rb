class Auth::SignUpService < TransactionService
    attr_reader :company, :user, :email

    def initialize(company, user, email)
        @company = company
        @user = user
        @email = email
    end

    def call
        # Save the company
        company.save!
        
        # Save the user
        user.company_id = company.id
        user.save!

        # Save the email confirmation for the user
        token = SecureRandom.urlsafe_base64(16)
        UserEmailConfirmation.create!(:user_id => user.id, :email => email, :token => token)
    end
end