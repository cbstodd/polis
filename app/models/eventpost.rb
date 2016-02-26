class Eventpost < ActiveRecord::Base
  belongs_to :user

  searchkick

  # Creates a scope to organize eventposts in descending order in the database.
  # scope :order, lambda {|*args| {:order => (args.first || 'created_at DESC')} }
  default_scope -> { order(event_date: :asc) }

  # scope :desc, order("eventposts.created_at DESC")

  mount_uploader :event_image, EventImageUploader

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :content, presence: true, length: { maximum: 2000 }
  validate  :event_image_size
  #Validates proper date.
  validates_each :event_date do |record, attr, value|
    begin
      Date.parse(value)
    rescue
      record.errors.add(attr, 'Invalid date')
    end
  end

  # Assigns :event_date to :start_time to work with month_calendar.
  #  its needed in order for it to work with simple_calendar gem.
  def start_time
    self.event_date
  end

  private

    def event_image_size
      if event_image.size > 5.megabytes
        errors.add(event_image_size, "should be less than 5MB")
      end
    end


end
