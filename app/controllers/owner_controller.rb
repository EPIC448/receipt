class OwnersController < ApplicationController

  configure do
    enable :sessions
    set :session_secret, "owner_session"
  end


  # GET: /sign_up
  get "/sign_up" do

    if !logged_in?
      erb :"/owner/new" #locals: {message: "Please sign up before you sign in"}
    else
     redirect to "/pay_receipts"     
    end

  end

  # GET: /owners/new
  get "/owner/new" do
    erb :"/owners/new.html"
  end

  # POST: /owners
  post "/owner" do

    if params[:name] == "" || params[:email] == "" || params[:password] == ""

      redirect to '/sign_up'
    else
      @owner = Owner.create(:name => params[:name], :email => params[:email], :password => params[:password])
      session[:owner_id] = @owner.id
      redirect "/pay_receipts"
    end

  end


  # logged-in code

  get '/login' do
    if !logged_in?
      erb :'/owner/login'
    else
      redirect '/pay_receipts' 
    end

  end


  post '/login' do
    owner = Owner.find_by(:name => params[:name])  # Take name to get users  name
    if owner && owner.authenticate(params[:password])
      session[:owner_id] = owner.id

      redirect to '/pay_receipts'
    else
      redirect to '/sign_up'
    end

  end



  # <------Edit---->

  # GET: /owners/5
  get "/owner/:id" do
    erb :"/owners/show.html"
  end

  # GET: /owners/5/edit
  get "/owner/:id/edit" do
    erb :"/owners/edit.html"
  end

  # PATCH: /owners/5
  patch "/owner/:id" do
    redirect "/owners/:id"
  end

  # DELETE: /owners/5/delete
  delete "/owner/:id/delete" do
    redirect "/owner"
  end
end
