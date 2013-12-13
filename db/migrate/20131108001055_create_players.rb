class CreatePlayers < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :team
      t.string :gsis
      t.string :college
      t.string :birthdate
      t.string :user
      t.string :height
      t.string :weight
      t.string :url
      t.string :number
      t.timestamps
      t.belongs_to :user
      t.references 'stat'
    end
  end

  def down
    drop_table :players
  end
end
