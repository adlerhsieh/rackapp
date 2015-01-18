class AuthApp < Sinatra::Base
	require 'json'
	enable :sessions
	configure(:development) { set :session_secret, "something" }

	Users = [
		{
			email: "nkj20932@hotmail.com",
			password: "hello"
		},
		{
			email: "nkj20933@hotmail.com",
			password: "hello"
		}
	]


	Images = [
		{id: 1, url: 'http://i.imgur.com/pE41fjj.jpg', title: "duolingo"},
		{id: 2, url: 'http://i.imgur.com/RuAHOIK.jpg', title: "McDonaled's Trip"},
		{id: 3, url: 'http://i.imgur.com/tWPf0go.jpg', title: "I think my Chinese food is undercooked"}
	]

	helpers do
		def current_user
			@current_user 
		end
	end

	before do
		@current_user = session[:current_user]
	end

	get '/' do
		"This is Sinatra root"
	end

	before '/imgs' do
		halt 'Not logged in' unless @current_user
	end

	get '/imgs' do
		erb :"index.html"
	end

	# json格式要寫在general的上面
	get "/imgs/:id.json" do |imgid|
		content_type 'text/json'
		Images.each do |img|
			if img[:id].to_i == imgid.to_i
				return img.to_json
			end
		end 		
	end

	get '/imgs/:id' do
		Images.each do |img|
			if img[:id] == params[:id].to_i
				@img = img
				break
			end
		end 
		erb :"show.html"
	end

	get "/login" do
		erb :'login.html'
	end

	post '/login' do
		Users.each do |user|
			if user[:email] == params[:email] && user[:password] == params[:password]
				@current_user = user
				session[:current_user] = user
				return erb :"welcome.html"
			else
				redirect "/login"
			end
		end
	end

end