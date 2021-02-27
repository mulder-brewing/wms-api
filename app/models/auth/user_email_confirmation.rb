class Auth::UserEmailConfirmation < ApplicationRecord
    belongs_to :user

    validates :user_id, uniqueness: true
    validates :email, presence: true, length: { maximum: EMAIL_LENGTH }, format: { with: EMAIL_REGEX }
    validates :token, presence: true, uniqueness: true
end
