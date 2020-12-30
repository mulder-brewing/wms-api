class SignUpForm < BaseForm

    def submit(user, company)
        validate(company)
        if errors_response.empty?
            return { message: 'valid' }
        else
            return { errors: errors_response }
        end
    end

end