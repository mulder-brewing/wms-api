class Auth::ConfirmEmailService < TransactionService
    attr_reader :token

    def initialize(token)
        @token = token
    end

    def call
        begin
            # Lookup the email confirmation by the token
            email_confirmation = Auth::UserEmailConfirmation.find_by(token: token)

            if email_confirmation == nil
                raise StandardError.new "Failed to find email confirmation with token"
            end

            # Now that email is confirmed, save email to user
            user = email_confirmation.user
            user.email = email_confirmation.email
            user.save!

            # The email confirmation no longer serves a purpose, delete it.
            email_confirmation.destroy!
        rescue StandardError => e
            raise Auth::EmailConfirmationFailedError.new(e)
        end
    end
end
