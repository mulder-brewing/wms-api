class CreateAuthAccessPolicies < ActiveRecord::Migration[6.1]
    def change
        create_table :auth_access_policies do |t|
            t.references :company, null: false, index: true
            t.text :description

            t.timestamps
        end

        add_foreign_key :auth_access_policies, :auth_companies, column: :company_id
    end
end
