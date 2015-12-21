class CreateEventposts < ActiveRecord::Migration
  def change
    create_table :eventposts do |t|
      t.string :title
      t.text   :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :eventposts, [:updated_at, :created_at]
  end
end
