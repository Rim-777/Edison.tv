class News < ActiveRecord::Base
  validates :user_id, :commentary, presence: true
  belongs_to :user
  belongs_to :newsable, polymorphic: true, touch: true

  default_scope { order(created_at: :desc)}
end
