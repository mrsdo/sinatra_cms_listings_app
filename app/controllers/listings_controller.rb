class ListingsController < ApplicationController

  # GET: NOT LOGGED IN - View Listing Details
  get "/listings/view-listings" do
    @listing = Listing.all
    erb :"/listings/view-listings"
  end

  # Handles Logged in Users
  ####
  # Show logged in Users Listings
  get "/listings" do
    # if the user is signed in?
    if signed_in? == true
      @user = User.find(session[:user_id])
      @listings = Listing.where(user_id: current_user)
      erb :'/listings/show.html'
    else
       redirect "/signin"
    end
  end

  private
  def find_listing
    @listing = Listing.find_by_id(params[:id])
  end


end
