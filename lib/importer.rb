module Importer
  require 'csv'

  def self.perform
    return false unless data_ok?
    progress = ProgressBar.create(title: 'Crunching', total: data.count)
    data.each do |row|
      Topic.find_or_create_by(slug: row[0]) do |top|
        Vote.find_or_create_by(topic: top,
                               verse: Verse.find_or_create_by(slug: row[1]),
                               verse_end: Verse.find_or_create_by(slug: row[2])) do |ver|
           ver.update(tally: row[3])
         end
      end
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
