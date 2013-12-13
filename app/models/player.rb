class Player < ActiveRecord::Base
  belongs_to :user
  has_one :stat
  def self.all_positions
    %w(QB TE RB WR DE K)
  end
  attr_protected
end
