require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @list = Bookmark.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do 
    Bookmark.create(url: params['url'], title: params['title'])
    redirect '/'
  end 

  delete '/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/'
  end

end
