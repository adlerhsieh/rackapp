require 'bundler'
Bundler.setup
Bundler.require

class MyApp < Sinatra::Base

	get '/' do
		"Sinatra root"
	end
end

run MyApp