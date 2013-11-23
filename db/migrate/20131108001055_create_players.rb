class CreatePlayers < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :team
      t.string :id
      t.string :college
      t.string :birthdate
      t.string :user
      t.string :height
      t.string :weight
      t.string :url
      t.string :number
      t.timestamps
    end
  end

  def down
    drop_table :players
  end
end
