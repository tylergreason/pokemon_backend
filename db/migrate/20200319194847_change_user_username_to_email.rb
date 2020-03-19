class ChangeUserUsernameToEmail < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :username 
    add_column :users, :email, :string
  end
end
