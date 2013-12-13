class Stat < ActiveRecord::Base
  attr_protected
  belongs_to :player
end
