class Picture < ActiveRecord::Base
  validates :user_id, :album_id, presence: true
  belongs_to :user
  belongs_to :album

  mount_uploader :image, ImageUploader
end
