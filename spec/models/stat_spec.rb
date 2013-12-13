require 'spec_helper'

describe Stat do

  describe 'get player' do
    Stat.get('Vernon Davis')
  end

  describe 'mapstats' do
    Stat.mapStats(map)
  end

  describe 'find stats' do
    Stat.findStats(obj,key)
  end

  describe 'nested hash val' do
    Stat.nested_hash_value(obj,key)
  end

end
