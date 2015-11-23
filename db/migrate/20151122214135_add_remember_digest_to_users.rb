class AddRememberDigestToUsers < ActiveRecord::Migration
  def change
    # Creates cookies to remember users signed in
      # status after leaving site.
    add_column :users, :remember_digest, :string
  end
end
