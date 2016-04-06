task :default => [:download, :import, :server]

task :import do
  ruby 'import.rb'
end

task :server do
  ruby 'app.rb'
end

task :download do
  `wget -N 'https://a.openbible.info/data/topic-votes.txt'`
end
