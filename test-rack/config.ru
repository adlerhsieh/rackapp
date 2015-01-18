require 'rubygems'

class RackApp
	def call(env)
		[
			200,
			{"Content-Type" => "text/html"},
			[
				env.inspect
			]
		]
	end

end

run RackApp.new

# env.inspect
# env內包含的資料
# SERVER_NAME
# REQUEST_PATH 完整的path
# REQUEST_URI 
# QUERY_STRING 網址後方包含的變數