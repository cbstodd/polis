class AddEventDateToEventpost < ActiveRecord::Migration
  def change
    add_column :eventposts, :event_date, :string
  end
end
