require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: './bbs.db'
)

class Comment < ActiveRecord::Base
  validates :body, presence: true
end

get '/' do
  @title = "My BBS"
  @comments = Comment.all
  erb :index
end


post '/create' do
  Comment.create(body:params[:body])
  redirect to('/')
end


post '/destroy' do
    Comment.find(params[:id]).destroy
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
# get '/hello/:farstName/?:lastName?' do |f,l|
#   "hello,#{f} #{l}"
# end


# ワイルドカード
# get '/hello/*/*' do |f,l|
#   "hello,#{f} #{l}"
# end


# ブロックの引数を使わない方法
# get '/hello/*/*' do
#   "hello,#{params[:splat][0]} #{params[:splat][1]}"
# end


# 正規表現を使う
# get %r{/users/([0-9])*} do
#   "users ID = #{params[:captures][0]}"
# end








