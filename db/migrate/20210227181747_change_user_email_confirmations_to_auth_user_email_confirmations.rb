class ChangeUserEmailConfirmationsToAuthUserEmailConfirmations < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_email_confirmations, :auth_user_email_confirmations
  end
end
