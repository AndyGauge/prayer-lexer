module Importer
  require 'csv'
  require 'ruby-progressbar'
  require 'classifier-reborn'
  require './lib/biblical'

  def self.perform
    return false unless data_ok?
    progress = ProgressBar.create(title: 'Crunching', total: data.count)
    data.each do |row|
      classifier.train(row[1], row[0])
      progress.increment
    end
    classifier_snapshot = Marshal.dump classifier
    File.open(snapshot, "wb") {|file| file.write(classifier_snapshot) }
    true
  end

  def self.lex(prayer)
    slug = classifier.classify prayer
    "#{Biblical.books[slug[0..1].to_i]} #{slug[2..4].to_i}:#{slug[5..7].to_i}"
  end

  def self.classifier
    @classifier ||= File.exists?(snapshot) ? retrieve_snapshot : new_classifier
  end

  def self.retrieve_snapshot
    data = File.open(snapshot, 'rb') { |file| file.read }
    Marshal.load data
  end

  def self.snapshot
    'classifier.dat'
  end

  def self.file_name
    'topic-votes.txt'
  end

  def self.data
    @parsed ||= CSV.read(file_name, col_sep: "\t")
  end

  def self.data_ok?
    @data_is_ok ||= data.shift.include? 'Topic'
  end

  def self.new_classifier
    ClassifierReborn::Bayes.new(auto_categorize: true) 
  end
end
