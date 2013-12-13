require 'spec_helper'

describe Player do
  describe 'adding a player' do
    Player.create!('Arian Foster')
    Player.create!('Frank Gore')
    Player.Create!('Ricky Stanzi')
  end

  describe 'all positions'
    Player.all_positions
  end
end
