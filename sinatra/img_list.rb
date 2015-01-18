class ImgList < Sinatra::Base
	Images = [
		{url: 'http://i.imgur.com/pE41fjj.jpg', title: "duolingo"},
		{url: 'http://i.imgur.com/RuAHOIK.jpg', title: "McDonaled's Trip"},
		{url: 'http://i.imgur.com/tWPf0go.jpg', title: "I think my Chinese food is undercooked"}
	]

	get '/imgs' do
		erb :"index.html"
	end
end