class AddFullAccessToAuthAccessPolicy < ActiveRecord::Migration[6.1]
    def change
        add_column :auth_access_policies, :full_access, :boolean, null: false, default: false
    end
end
