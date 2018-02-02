class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
    # you select a default value of false - new users by default should not be admins
  end
end
