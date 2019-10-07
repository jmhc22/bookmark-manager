require 'sinatra'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmark_list = [
      "https://www.google.com",
      "https://www.facebook.com",
      "https://www.bbc.co.uk"
    ]
    erb(:bookmark_list)
  end

  run! if app_file == $0

end
