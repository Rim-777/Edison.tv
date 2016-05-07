class User < ActiveRecord::Base
  attr_reader :avatar_crop

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and,:omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :profile
  has_many :albums, dependent: :destroy
  has_many :pictures, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def crop_avatar!(coordinates)
    coordinates.each { |k, v| coordinates[k] = v.to_i }
    @avatar_crop = coordinates
    avatar.recreate_versions!
  end
end
