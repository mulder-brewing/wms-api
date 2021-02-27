class ChangeCompaniesToAuthCompanies < ActiveRecord::Migration[6.1]
  def change
    rename_table :companies, :auth_companies
  end
end
