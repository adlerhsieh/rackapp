class Framework
	@@routes = {}

	class << self
		def params
			@@params
		end

		def request
			@@request
		end

		DEFAULT_LAYOUT = "views/layout.erb"
		def render view_path, options={}
			layout_path = options.delete(:layout_path) || DEFAULT_LAYOUT
			locals_hash = options.delete(:locals) || {}
			template_path = File.join("views", "#{view_path}.erb")
			# 先定義內部template
			view_buffer = Tilt::ERBTemplate.new(template_path).render(self, locals_hash)
			# 從外部開始render，再將content render到內部給yield執行
			Tilt::ERBTemplate.new(layout_path).render(self, locals_hash) do
				view_buffer
			end
			# Tilt::ERBTemplate.new(template_path).render(self, locals_hash)
		end

		def get(path, &block)
			# 定義get時，@@routes已經定義完成，可以依照request來回傳
			@@routes[path] = block		
		end

		def find_route_execute env
			# 查詢env裡面的"PATH_INFO"這個key裡面的value
			path = env['PATH_INFO']

			# @@routes已經在get裡面被塞進去過，所以可以直接查詢
			# if @@routes.has_key? path
			# 	@@routes[path].call
			# end

			@@routes.each do |path_exp, code_block|
				var_arr = path.scan(path_exp).flatten
				unless var_arr.empty?
					return code_block.call(*var_arr)
				end
			end
			""
		end

		# rack最先執行的method
		def call env
			@@request = Rack::Request.new env
			@@params = @@request.params
			[
				200,
				{"Content-Type" => "text/html"},
				# 將回傳值改為method，可以回傳自訂內容
				[find_route_execute(env)]
			]
			
		end
	end
end