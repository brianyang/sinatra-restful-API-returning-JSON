require 'rubygems'
require 'sinatra'
require 'mongo'
require 'json'



get '/' do
  "handle route and write to db"
end

get '/db' do
db = Mongo::Connection.new.db("test")
coll = db.collection("foo")
doc = {"tester" => "tested", "info" => {"x" => 203, "y" => '102'}}
coll.insert(doc)
'store'

end

get '/example.json' do
  content_type :json
  { :key1 => 'value1', :key2 => 'value2' }.to_json
end


get '/save/:topVal/:leftVal/:elemId' do

db = Mongo::Connection.new.db("test")
coll = db.collection("foo")
topVal = params[:topVal]
leftVal = params[:leftVal]
elemId = params[:elemId]
doc = {"_id"=>elemId, "top"=> topVal, "left'"=>leftVal}
coll.save(doc)

  content_type :json
  { :top => params[:topVal], :left => params[:leftVal] }.to_json  
  
end



