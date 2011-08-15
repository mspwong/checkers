# == Schema Information
# Schema version: 20110815055126
#
# Table name: teams
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Team < ActiveRecord::Base
  has_many :pieces
end
