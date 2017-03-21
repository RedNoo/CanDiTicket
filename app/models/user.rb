class User < ActiveRecord::Base
  #has_many :tickets
  before_save {self.email = email.downcase}
VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,uniqueness: {case_sensitive: false}, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :full_name, presence: true
  validates :password_digest, presence: true
  validates :password, presence: true
  has_secure_password

end
