class Company < ApplicationRecord
    has_many :users, dependent: :destroy

    validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

    # Strip whitespace
    def name=(val)
        super(val&.strip)
    end
end
