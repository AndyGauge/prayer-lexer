require 'sinatra'
require './lib/importer.rb'
require 'net/http'
require 'uri'
require 'json'

set :bind, '0.0.0.0'

get '/' do
  '<h1>Lex:</h1> <h2>Prayer-lexer recommends verses based on context of prayers</h2> 
  <p>Send a post request to this same route to compute the verse appropriate for the content of the request</p>
  <form action="/" method="post"><input type=text name="prayer"><input type="submit"></form>' 
end

post '/' do
  return "bad request" if params.nil?
  request = params.values.reduce.nil? ? params.keys.reduce : params.values.reduce
  response = JSON.parse(Net::HTTP.get_response(URI.parse(URI.escape("http://bible-api.com/#{Importer.lex request}"))).body)
  "#{response["reference"]} #{response["text"]}"
end
