class ImgList < Sinatra::Base
	Images = [
		{id: 1, url: 'http://i.imgur.com/pE41fjj.jpg', title: "duolingo"},
		{id: 2, url: 'http://i.imgur.com/RuAHOIK.jpg', title: "McDonaled's Trip"},
		{id: 3, url: 'http://i.imgur.com/tWPf0go.jpg', title: "I think my Chinese food is undercooked"}
	]

	get '/imgs' do
		erb :"index.html"
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
end