class Eventpost < ActiveRecord::Base
  belongs_to :user

  # Creates a scope to organize eventposts in descending order in the database.
  default_scope -> { order(created_at: :desc) }

  # scope :desc, order("eventposts.created_at DESC")


  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :content, presence: true, length: { maximum: 2000 }
end
