class CreateUserEmailConfirmations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_email_confirmations do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.text :email, null: false
      t.text :token, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
