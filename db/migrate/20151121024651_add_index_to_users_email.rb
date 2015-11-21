class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #Creates index so when two users click signup
      # at the same time it will fail (throw error).
    add_index :users, :email, unique: true
  end
end
