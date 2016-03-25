namespace :importer do
  desc "parses file in rails root directory named topic-votes.txt.  This file is downloaded from https://a.openbible.info/data/topic-votes.txt (probably should be another rake task)"
  task perform: :environment do
    require 'importer'
    Importer.perform
  end
  task train: :environment do
    require 'importer'
    Importer.train
  end
end
