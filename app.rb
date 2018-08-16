require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb :index
end























# URLから値を受け取る
# get '/hello/:name' do
#   "hello,#{params[:name]}"
# end



# paramsを使わない受け取りかた。
# get '/hello/:name' do |name|
#   "hello,#{name}"
# end


# URLから値を二つ受け取る
# get '/hello/:firstName/:lastName' do |f,l|
#    "hello,#{f}#{l}"
# end


# 受け取る値をoptional(入れても入れなくてもいい)にする
get '/hello/:farstName/?:lastName?' do |f,l|
  "hello,#{f} #{l}"
end










