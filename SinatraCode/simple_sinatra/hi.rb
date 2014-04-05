require 'sinatra'

get '/' do
  "Hello World!"
end

get '/hello/:name' do
  "Hello #{params[:name]}!"
end

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params[:splat] # => ["hello", "world"]
end