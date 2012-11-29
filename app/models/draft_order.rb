class DraftOrder < ActiveRecord::Base
  attr_accessible :pick, :round, :team
  validates :pick,:round,:team, :presence => true
  belongs_to :team
end
