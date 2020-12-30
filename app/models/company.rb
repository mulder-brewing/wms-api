class Company < ApplicationRecord
    validates :name, presence: true, length: { maximum: 1 }, uniqueness: { case_sensitive: false }
end
