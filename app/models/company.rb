class Company < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

    # Strip whitespace
    def name=(val)
        super(val&.strip)
    end
end
