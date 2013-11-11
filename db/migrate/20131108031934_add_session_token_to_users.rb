class AddSessionTokenToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :session_token, :string
  	add_index :users, :session_token
  end
  
  def down
    remove_index :users, :session_token
    remove_column :users, :session_token
  end
end
