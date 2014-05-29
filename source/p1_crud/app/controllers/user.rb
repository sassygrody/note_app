# GET -------------------------------------------------
get '/login' do 
  # Look in app/views/index.erb

  erb :index
end

# upon clicking 'create account'
get '/new_user' do

  erb :_new_user
end

# after login, get this page
get '/homepage' do
  current_user

  @notes = Note.all  #this gets to @notes in homepage.erb
  erb :homepage
end



get '/logout' do
  session.clear
  redirect '/'
end


# POST -------------------------------------------------

# user login
post '/login' do
  @user = User.authenticate(params[:username], params[:password])
    if @user
      give_session
      redirect to '/homepage'
    else
      redirect to '/login'
    end
end

# create new user
post '/new_user' do
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
      give_session
    redirect to '/homepage'
  else
    redirect to '/'
  end
end


# go to homepage from log in
post '/homepage' do
  current_user
  @notes = current_user.notes

  redirect '/homepage'
end




