require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require "sinatra/json"

require './models/bookmark.rb'

get '/' do
    @bookmarks = Bookmark.all
    erb :index
end

post '/reate' do
	p "受け取ったタイトル"
	p params[:title]
	p "受け取ったURL"
	p params[:url]
	p "受け取った金額"
	p params[:money]
	p "受け取っためっせーじ"
	p params[:message]
	p "受け取ったサイト"
	p params[:site]
	p "受け取ったカテゴリー"
	p params[:categories]
	p "受け取ったなんか"
	p params[:janlus]
    Bookmark.create(
        title: params[:title],
        url: params[:url],
        money: params[:money],
        message: params[:message],
        site: params[:site],
        categories: params[:categories],
        janlus: params[:janlus],
        )
        
    redirect '/'
end

get '/api/site' do
    html = Nokogiri::HTML.parse(open(params[:url]))
    title = html.css('title').text
    data = {title: title}
    json data
end

post '/delete/:unko' do
    Bookmark.find(params[:unko]).destroy
    redirect '/'
end

get '/index.erb' do
  erb :index
end
