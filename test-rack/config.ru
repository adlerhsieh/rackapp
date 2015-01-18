require './framework.rb'

class MyApp < Framework

	# get 是class method，必須使用class variable才能使用
	# run 的時候，以下部分都會先執行，才去跑call
	get '/' do
		"in root"
	end

	get '/hello' do
		"hello"
	end
end

# 開伺服器，等request進來
# run的時候，get定義都已經完成
run MyApp