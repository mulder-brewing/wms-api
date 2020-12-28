class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :company, null: false, foreign_key: true
      t.text :username, null: false, index: { unique: true }
      t.text :password_digest, null: false

      t.timestamps
    end
  end
end
