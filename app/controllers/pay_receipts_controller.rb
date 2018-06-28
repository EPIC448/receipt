class PayReceiptsController < ApplicationController

  configure do
    enable :sessions
    set :session_secret, "owner_session"
  end


  # GET: /pay_receipts
  get "/pay_receipts" do
     
    if logged_in?
      @users = current_user
      @pay_receipts = Pay_receipt.all
      erb :'/pay_receipts/index'
    else
      redirect to "/login"
    end
    
    erb :"/pay_receipts/index.html"
  end

  # GET: /pay_receipts/new
  get "/pay_receipts/new" do
    erb :"/pay_receipts/new.html"
  end

  # POST: /pay_receipts
  post "/pay_receipts" do
    redirect "/pay_receipts"
  end

  # GET: /pay_receipts/5
  get "/pay_receipts/:id" do
    erb :"/pay_receipts/show.html"
  end

  # GET: /pay_receipts/5/edit
  get "/pay_receipts/:id/edit" do
    erb :"/pay_receipts/edit.html"
  end

  # PATCH: /pay_receipts/5
  patch "/pay_receipts/:id" do
    redirect "/pay_receipts/:id"
  end

  # DELETE: /pay_receipts/5/delete
  delete "/pay_receipts/:id/delete" do
    redirect "/pay_receipts"
  end
end
