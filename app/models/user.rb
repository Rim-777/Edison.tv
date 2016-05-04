class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and,:omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_reader :avatar_crop
  has_one :profile

  mount_uploader :avatar, AvatarUploader

  def crop_avatar!(coordinates)
    coordinates.each { |k, v| coordinates[k] = v.to_i }
    @avatar_crop = coordinates
    avatar.recreate_versions!
  end
end
