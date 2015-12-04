class Chef < ActiveRecord::Base
  has_many :recipes
  validates :chefname, presence: true, length: { minimum: 2, maximum: 40 }
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }
end