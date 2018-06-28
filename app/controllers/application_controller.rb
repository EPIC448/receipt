require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'

     set :views, "app/views"  #we tell our app to look in the views.. for the ERB...
    
     enable :sessions
     
     set :session_secret, "owner_session"
  end


  get "/" do
    erb :welcome
  end


  helpers do

    def logged_in?
      !!current_user
    end


    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end

end
