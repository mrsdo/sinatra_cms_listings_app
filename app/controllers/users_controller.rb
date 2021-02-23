class UsersController < ApplicationController

  get '/users' do
    if signed_in?
      @user = User.find(session[:user_id])
      # Display the listings where user_id = to current user
      erb :"users/show.html"
    else
      redirect "/signin"
    end
  end
  get '/users/:id' do
    if signed_in?
      @user = User.find(params[:id])
      # binding.pry
      erb :'/users/show.html'
    else
      redirect '/signin'
    end
  end
  # GET:
  get "/signin" do
    if signed_in?
      redirect '/listings'
    else
      erb :"/users/signin.html"
    end
  end

  # GET:
  get "/signup" do
    if signed_in?
      redirect '/listings'
    else
      erb :"/users/new.html"
    end
  end

  # POST:
  post "/signin" do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/listings'
    else
      redirect "/signup"
    end
  end
  #POST: Create:
  post "/signup" do
    # if one of the entry field is empty direct to the signup page
    if params[:fname].empty? || params[:lname].empty? || params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect "/signup"
    else

      @user = User.create(:fname => params[:fname], :lname => params[:lname], :username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect "/listings"
    end
  end
  get "/signout" do
    # if the user is logged in then clear the session and redirect to the /signin page
    # else redirect to the /index page
    if signed_in?
      session.destroy
      redirect "/signin"
    else
      redirect "/welcome"
    end
  end

  # GET: /users/5 show a user with specific id
  get "/users/:id/edit" do
    @user = User.find_by(id: session[:user_id])
    if @user
    erb :"/users/edit.html"
    else
      redirect "/signin"
    end
  end
  patch '/users/:id' do
    # binding.pry
    if signed_in?
      if params[:fname].empty?
        redirect "/users/#{params[:id]}/edit"
      else
        @user = User.find_by_id(params[:id])
        if @user == current_user
          if @user.update(:fname => params[:fname], :lname => params[:lname], :username => params[:username], :email => params[:email])
            redirect to "/users/#{@user.id}"
          else
          redirect to "/users/#{@user.id}/edit"
          end
        else
          redirect to '/users'
        end
      end
    else
      redirect '/signin'
    end
  end
  # patch "/users/:id" do
  #   # raise params.inspect
  #   # todo with the specific id
  #   @user = User.find(params[:id])
  #   # binding.pry
  #   @user.update(name: params[:name], email: params[:email])
  #   # binding.pry
  #     redirect "/users/#{@user.id}"
  # end
end
