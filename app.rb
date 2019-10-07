require 'sinatra'
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmark_list = Bookmark.all
    erb(:bookmark_list)
  end

  run! if app_file == $0

end
