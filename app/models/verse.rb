class Verse < ActiveRecord::Base
  include Biblical
  has_many :votes
  has_many :topics, through: :votes

  before_save do |verse|
    self.book ||= biblical_books[slug[0..1].to_i]
    self.chapter ||= slug[2..4].to_i
    self.verse ||= slug[5..7].to_i
  end

  def inspect
    "#{book} #{chapter}:#{verse}"
  end
end
