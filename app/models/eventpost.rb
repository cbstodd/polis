class Eventpost < ActiveRecord::Base
  belongs_to :user


  # Creates a scope to organize eventposts in descending order in the database.
  default_scope -> { order(created_at: :desc) }
  # scope :desc, order("eventposts.created_at DESC")

  mount_uploader :event_image, EventImageUploader

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :content, presence: true, length: { maximum: 2000 }
  validate  :event_image_size
  # validates_format_of :event_image

  # def start_time
  #   self.event_date.start
  # end

  private

    def event_image_size
      if event_image.size > 5.megabytes
        errors.add(event_image_size, "should be less than 5MB")
      end
    end


end
