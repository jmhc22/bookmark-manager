require 'sinatra'
require 'uri'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require './lib/comment'
require './lib/tag'
require_relative './database_connection_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmark_list
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    redirect('/bookmarks') if Bookmark.create(url: params[:url], title: params[:title])
    flash[:notice] = "You must submit a valid URL."
    redirect '/bookmarks/new'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    redirect '/bookmarks' if Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    flash[:notice] = "You must submit a valid URL."
    redirect "/bookmarks/#{params[:id]}/edit"
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/tags/new' do
    @bookmark_id = params[:id]
    erb :'tags/new'
  end

  post '/bookmarks/:id/tags' do
    Tag.create(tag_text: params[:tag], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
