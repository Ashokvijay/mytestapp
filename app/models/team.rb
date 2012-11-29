class Team < ActiveRecord::Base
  attr_accessible :division, :name
  belongs_to :division
  validates :name,:division, :presence => true
end
