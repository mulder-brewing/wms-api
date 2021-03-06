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

        # Create the access policy
        access_policy = company.access_policies.create!(description: 'Full Access', full_access: true)

        # Setup user associations
        company.users << user
        access_policy.users << user

        # Save the user
        user.save!

        # Save the email confirmation for the user
        token = SecureRandom.urlsafe_base64(16)
        email_confirmation = Auth::UserEmailConfirmation.new(user_id: user.id, email: email, token: token)
        email_confirmation.save!

        # Send the email
        Auth::AccountsMailer.confirm_email(email_confirmation).deliver_now
    end
end
