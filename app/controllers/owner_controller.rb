class OwnersController < ApplicationController

  configure do
    enable :sessions
    set :session_secret, "owner_session"
  end


  # GET: /sign_up
  get "/sign_up" do
    if !logged_in?

      erb :'owner/new', locals: {message: "Please sign up before you sign in"}
    else
     redirect to "/pay_receipts"     
    end

  end

  # GET: /owners/new
  get "/owners/new" do
    erb :"/owners/new.html"
  end

  # POST: /owners
  post "/owners" do

    if params[:username] == "" || params[:email] == "" || params[:password] == ""

      redirect to '/signup'

    else
      @owner = Owner.create(:name => params[:name], :email => params[:email], :password => params[:password])
      session[:owner_id] = @owner_id
      redirect "/pay_receipts"
    end

  end


  # logged-in code
  get '/login' do

    if !logged_in?
      erb :'/owner/login'
    else
      redirect '/pay_receipts'  #tweets control

    end

  end



  # <------Edit---->

  # GET: /owners/5
  get "/owners/:id" do
    erb :"/owners/show.html"
  end

  # GET: /owners/5/edit
  get "/owners/:id/edit" do
    erb :"/owners/edit.html"
  end

  # PATCH: /owners/5
  patch "/owners/:id" do
    redirect "/owners/:id"
  end

  # DELETE: /owners/5/delete
  delete "/owners/:id/delete" do
    redirect "/owners"
  end
end
