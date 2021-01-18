class Auth::SignUpService < ApplicationService
    attr_reader :company, :user

    def initialize(company, user)
        @company = company
        @user = user
    end

    def call
        ActiveRecord::Base.transaction do
            # Save the company
            company.save!
            
            # Save the user
            user.company_id = company.id
            user.save!
        end
    end
end