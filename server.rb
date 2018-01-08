#!/usr/bin/env ruby

$LOAD_PATH << '.'

require 'bundler/setup'

require 'active_record'
require 'graphql'
require 'sinatra'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'graphql_test_server.sqlite3.db',
)

require 'models/node'

require 'types/mutation_type'
require 'types/node_type'
require 'types/query_type'
require 'types/schema'


get '/api' do
  content_type :json

  Schema.execute(params[:query]).to_json
end

post '/api' do
  graphql_query = JSON.parse(request.body.read)

  content_type :json

  Schema.execute(graphql_query['query']).to_json
end
