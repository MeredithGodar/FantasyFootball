class CreateUsers < ActiveRecord::Migration
  def up
  end
	
	def change
		create_table :users do |t|
			t.string :user_id
			t.string :email
			t.string :password_digest
			t.timestamps
		end
	end
	
  def down
  end
end
