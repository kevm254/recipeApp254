class Recipe < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :chef
  has_many :likes

  # VALIDATIONS
  validates :chef_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum:10, maximum: 150 }
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }

  mount_uploader :picture, PictureUploader

  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end
end