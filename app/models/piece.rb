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

  validate :move_immediate_forward_diagonal

  def move(x, y)
    raise ArgumentError unless x.is_a?(Integer) && y.is_a?(Integer) && VALID_COORDINATES.include?(x) && VALID_COORDINATES.include?(y)

    self.x = x
    self.y = y
    self.save!
  end

  private

  #def stay_in_board
  #  errors.add(:x, 'must stay in board') unless VALID_COORDINATES.include? self.x
  #  errors.add(:y, 'must stay in board') unless VALID_COORDINATES.include? self.y
  #end

  def move_immediate_forward_diagonal
    #errors.add_to_base("must not move by more 1 row") unless (self.x - self.x.was).abs <= 1
    #errors.add_to_base("must not move by more 1 column") unless (self.y - self.y.was).abs <= 1
  end

end
