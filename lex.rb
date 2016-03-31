require './lib/importer'
require 'net/http'
require 'uri'
require 'json'
response = JSON.parse(Net::HTTP.get_response(URI.parse(URI.escape("http://bible-api.com/#{Importer.lex ARGV[0]}"))).body)
puts "#{response["reference"]} #{response["text"]}"
