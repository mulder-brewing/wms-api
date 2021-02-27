class ChangeUsersToAuthUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :users, :auth_users
  end
end
