get '/' do
  # Look in app/views/index.erb
  # @messages = session[:messages]
  # session[:messages] = nil
  erb :index
end


# GET -------------------------------------------------


