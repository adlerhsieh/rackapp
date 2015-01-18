require 'rubygems'

class RackApp
	def call(env)
		[
			200,
			{"Content-Type" => "text/html"},
			[
				"hello"
			]
		]
	end

end

run RackApp.new