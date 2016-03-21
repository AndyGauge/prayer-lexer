module Importer
  require 'csv'

  def self.perform
    return false unless data_ok?
    progress = ProgressBar.create(title: 'Crunching', total: data.count)
    data.each do |row|
      top = Topic.find_or_create_by(slug: row[0])
      vote = Vote.where(topic: top,
                   verse: Verse.find_or_create_by(slug: row[1])).first_or_initialize(verse_end: Verse.find_or_create_by(slug: row[2]))
      vote.tally = row[3]
      vote.save
      progress.increment
    end
    true
  end

  def self.file_name
    Rails.root.join('topic-votes.txt')
  end

  def self.data
    @parsed ||= CSV.read(file_name, col_sep: "\t")
  end

  def self.data_ok?
    @data_is_ok ||= data.shift.include? 'Topic'
  end
end
