class Player < ActiveRecord::Base
  attr_accessible :name,:position
  belongs_to :position
  validates :name,:position :presence => true
end
