class MyApp < Sinatra::Base

	get '/' do
		"This is Sinatra root"
	end

	post '/books' do
		"POST BOOKS"
	end

	# 冒號後方自動會變成變數帶入params當中
	get '/user/:name' do
		"Hello #{params[:name]}"
	end

end