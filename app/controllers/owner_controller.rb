class OwneRsController < ApplicationController

  configure do
    enable :sessions
    set :session_secret, "owner_session"
  end


  # GET: /sign_up
  get "/sign_up" do
    if !log_in?

      erb :'owner/new', locals: {message: "Please sign up before you sign in"}
    else
     redirect to "/pay_receipts"     
    end

  end

  # # GET: /owne_rs/new
  # get "/owne_rs/new" do
  #   erb :"/owne_rs/new.html"
  # end

  # POST: /owne_rs
  post "/owne_rs" do

    if params[:username] == "" || params[:email] == "" || params[:password] == ""

      redirect to '/signup'

    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect "/pay_receipts"
    end

  end


  # log-in code

  # GET: /owne_rs/5
  get "/owne_rs/:id" do
    erb :"/owne_rs/show.html"
  end

  # GET: /owne_rs/5/edit
  get "/owne_rs/:id/edit" do
    erb :"/owne_rs/edit.html"
  end

  # PATCH: /owne_rs/5
  patch "/owne_rs/:id" do
    redirect "/owne_rs/:id"
  end

  # DELETE: /owne_rs/5/delete
  delete "/owne_rs/:id/delete" do
    redirect "/owne_rs"
  end
end
