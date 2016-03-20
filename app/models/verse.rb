class Verse < ActiveRecord::Base
  has_many :votes
  has_many :topics, through: :votes
end
