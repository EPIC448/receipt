class PayReceiptsController < ApplicationController

  configure do
    enable :sessions
    set :session_secret, "owner_session"
  end


  # GET: /pay_receipts
  get "/pay_receipts" do
     #our data is not getting here.

    if logged_in?
      @user = current_user
      @pay_receipts = PayReceipt.all
      erb :"/pay_receipts/index"   
     else
      redirect to "/login"
    end

  end

  # GET: /pay_receipts/new
  get "/pay_receipts/new" do

    if logged_in?
      @user = current_user
      erb :'pay_receipts/new'
    else
      redirect "/login"
    end
  end

  # POST: /pay_receipts
  post "/pay_receipts" do

    @pay_receipt = PayReceipt.new(params)
    @user = current_user
    #check if tweet is empty.
    # This is where we set the name for song/ it want us to pass in an hash.
    if logged_in? && !@pay_receipt.content.blank? && @pay_receipt.save
      @user.pay_receipts << @pay_receipt
      redirect to "/pay_receipts/#{@pay_receipt.id}"  # target Id of specific tweets.
    else
      redirect "/pay_receipts/new"  #this is a route
    end
  end

  # GET: /pay_receipts/5
  get "/pay_receipts/:id" do
    if logged_in?
      @pay_receipt = PayReceipt.find_by_id(params[:id])
    erb :"/pay_receipts/show"
    else
      redirect to "/login"
    end

  end

  # GET: /pay_receipts/5/edit
  get "/pay_receipts/:id/edit" do
    if logged_in?
      @pay_receipt = PayReceipt.find_by_id(params[:id]) # slug helps to find by name instaed of ID
      erb :"/pay_receipts/edit"
    else
      redirect to "/login"
      end
  end

  # PATCH: /pay_receipts/5
  patch "/pay_receipts/:id" do
    @pay_receipt = PayReceipt.find(params[:id])

    if logged_in? && !params[:content].blank?
       @pay_receipt.update(content: params[:content])  
    # :Note I can explicit with each.. but figures contains everthing already
    @pay_receipt.save

    redirect to "/pay_receipts/#{@pay_receipt.id}"  # Shows the newly updated content.
   else
    redirect to "/pay_receipts/#{@pay_receipt.id}/edit"  
   end
  end

  # DELETE: /pay_receipts/5/delete
  delete "/pay_receipts/:id/delete" do

    @pay_receipt = PayReceipt.find_by_id(params[:id])
    # does not like .user (use the owner instead)
    if logged_in? && @pay_receipt.owner == current_user  # Watch out for the "owner" not the "user"
      @pay_receipt.delete
      redirect to "/pay_receipts"

    else
      redirect to "/login"

    end
  end


end  #end of Pay_receipt controller
