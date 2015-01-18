require './framework.rb'

class MyApp < Framework

	# get 是class method，必須使用class variable才能使用
	# run 的時候，以下部分都會先執行，才去跑call

	get '/hello' do
		"hello"
	end

	get /\/books\/(\d+?)$/ do |id|
		"This is book #{id}"
	end

	# 是否定義routing 有前後順序問題？
	get '/' do
		"in root"
	end
end

# 開伺服器，等request進來
# run的時候，get定義都已經完成
run MyApp