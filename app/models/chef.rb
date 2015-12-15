class Chef < ActiveRecord::Base
  # CALLBACKS
  before_save { self.email = email.downcase }

  # ASSOCIATIONS
  has_many :recipes
  has_many :likes

  # VALIDATIONS
  validates :chefname, presence: true, length: { minimum: 2, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end