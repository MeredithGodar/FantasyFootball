class CreateStats < ActiveRecord::Migration
  def up
    create_table :stats do |t|
      t.belongs_to :player
    #Passing Stats
      t.integer :pass_att
      t.integer :pass_comp
      t.integer :pass_yrd
      t.integer :pass_td
      t.integer :int
    #Rushing Stats
      t.integer :rush_att
      t.integer :rush_yrd
      t.integer :rush_td
      t.integer :fumble
    #Receiving Stats
      t.integer :rec_yrd
      t.integer :rec_td
      t.integer :rec
      #Receiving fumbles are treated 
      #the same as rushing fumbles.
    #Kicking Stats
      t.integer :kick_att
      t.integer :kick_fg
      t.integer :kick_pat
      t.timestamps
    end
  end

  def down
    drop_table :stats
  end
end
