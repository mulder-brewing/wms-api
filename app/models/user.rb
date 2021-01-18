class User < ApplicationRecord
    has_secure_password
  
    belongs_to :company

    validates :company_id, presence: true
    validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

    # Strip whitespace
    def username=(val)
        super(val&.strip)
    end

    def password=(val)
        super(val&.strip)
    end

end
