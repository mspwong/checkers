# == Schema Information
# Schema version: 20110815055126
#
# Table name: pieces
#
#  id         :integer(4)      not null, primary key
#  team_id    :integer(4)      not null
#  x          :integer(4)      not null
#  y          :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Piece < ActiveRecord::Base
  VALID_COORDINATES = (1..8)
  belongs_to :team

  before_save :stay_in_board

  def move(x, y)
    raise ArgumentError unless x.is_a?(Integer) && y.is_a?(Integer)

    self.x = x
    self.y = y
    self.save!
  end

  private

  def stay_in_board
    (VALID_COORDINATES.include? self.x)  &&  (VALID_COORDINATES.include? self.y)
  end

end
