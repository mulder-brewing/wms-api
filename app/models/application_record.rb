class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  EMAIL_REGEX = /\A[^\s@]+@[^\s@]+\.[^\s@]+\z/
  EMAIL_LENGTH = 255
end
