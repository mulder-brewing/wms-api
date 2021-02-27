class AddAccessPolicyToAuthUser < ActiveRecord::Migration[6.1]
    def change
        add_reference :auth_users, :access_policy, null: false, foreign_key: { to_table: :auth_access_policies }
    end
end
