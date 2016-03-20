class Topic < ActiveRecord::Base
  has_many :votes
  has_many :verses, through: :votes
end
