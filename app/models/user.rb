class User < ActiveRecord::Base
  attr_reader :avatar_crop
  validates :first_name, presence: true

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and,:omniauthable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  has_many :albums, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :news, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def crop_avatar!(coordinates)
    coordinates.each { |k, v| coordinates[k] = v.to_i }
    @avatar_crop = coordinates
    avatar.recreate_versions!
  end
end
