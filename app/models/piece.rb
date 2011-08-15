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
end
