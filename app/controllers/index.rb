enable :sessions

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  @user = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  user = User.find_by_email(params[:email])
  if user.password == params[:password]
    session[:id] = user.id 
  end
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  "#{session.delete(:id)}"
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    erb :sign_up
  end
end
