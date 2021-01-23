class Auth::SignUpService < TransactionService
    attr_reader :company, :user

    def initialize(company, user)
        @company = company
        @user = user
    end

    def call
        # Save the company
        company.save!
        
        # Save the user
        user.company_id = company.id
        user.save!
    end
end