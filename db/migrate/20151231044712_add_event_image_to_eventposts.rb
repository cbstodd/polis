class AddEventImageToEventposts < ActiveRecord::Migration
  def change
    add_column :eventposts, :event_image, :string
  end
end
