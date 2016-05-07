class Album < ActiveRecord::Base
  validates :user_id, :title, presence: true
  belongs_to :user
  has_many :pictures, dependent: :destroy
end
