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
  belongs_to :team
  validate :move_immediate_forward_diagonal, :move_to_unoccupied

  def move(x, y)
    raise ArgumentError unless x.is_a?(Integer) && y.is_a?(Integer) && VALID_COORDINATES.include?(x) && VALID_COORDINATES.include?(y)

    self.x = x
    self.y = y
    self.save!
  end


  private

  VALID_COORDINATES = (1..8)

  def move_immediate_forward_diagonal
    if self.team.name == "white"
      errors.add_to_base('must only move immediate forward and diagonal') unless (y == y_was+1)  &&  ((x == x_was+1)  || (x == x_was-1))
    elsif self.team.name == "red"
      errors.add_to_base('must only move immediate forward and diagonal') unless (y == y_was-1)  &&  ((x == x_was+1)  || (x == x_was-1))
    end
  end

  def move_to_unoccupied
    pieces = Piece.all(:conditions => ["x=? and y=?", x, y])
    errors.add_to_base('must not move to an occupied square') unless pieces.blank?
  end

end
