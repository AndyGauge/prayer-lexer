module Importer
  require 'csv'

  def self.perform
    return false unless data_ok?
    progress = ProgressBar.create(title: 'Crunching', total: data.count)
    data.each do |row|
      top = Topic.find_or_create_by(slug: row[0])
      vote = Vote.where(topic: top, verse: Verse.find_or_create_by(slug: row[1]))
                 .first_or_initialize(verse_end: Verse.find_or_create_by(slug: row[2]))
      vote.tally = row[3]
      vote.save
      progress.increment
    end
    true
  end

  def self.train
    Vote.all.each do |vote|
      classifier.train(vote.verse_id, vote.topic.slug)
    end
    classifier_snapshot = Marshal.dump classifier
    File.open(snapshot, "wb") {|file| file.write(classifier_snapshot) }
  end

  def self.classifier
    @classifier ||= File.exists?(snapshot) ? retrieve_snapshot : new_classifier
  end
  def self.retrieve_snapshot
    data = File.open(snapshot, 'rb') { |file| file.read }
    Marshal.load data
  end

  def self.snapshot
    Rails.root.join('classifier.dat')
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

  def self.new_classifier
    ClassifierReborn::Bayes.new Vote.pluck(:verse_id).uniq
  end
end
