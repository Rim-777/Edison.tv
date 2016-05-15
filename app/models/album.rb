class Album < ActiveRecord::Base
  validates :user_id, :title, presence: true
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :news, as: :newsable, dependent: :destroy
  default_scope { order(created_at: :desc)}

  def is_empty?
    pictures.empty?
  end
end
