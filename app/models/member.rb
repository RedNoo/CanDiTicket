class Member < ActiveRecord::Base
  has_many :tickets
  before_save {self.email = email.downcase}
VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,uniqueness: {case_sensitive: false}, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :password_digest, presence: true
  has_secure_password

end
