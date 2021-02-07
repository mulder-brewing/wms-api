class User < ApplicationRecord
    has_secure_password
  
    belongs_to :company
    has_one :user_email_confirmation, dependent: :destroy

    validates :company_id, presence: true
    validates :email, length: { maximum: EMAIL_LENGTH }, format: { with: EMAIL_REGEX }, allow_blank: true
    validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

    # Regex for 8-40 characters, must have at least one uppercase, lowercase, number, and special character.
    VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d.*)(?=.*[!@#$%^&*]).{8,40}\z/
    validates :password, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true

    # Strip whitespace
    def username=(val)
        super(val&.strip)
    end

    def password=(val)
        super(val&.strip)
    end

end
