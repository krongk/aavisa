  
	#song:for easy search plugin
	RPH::EasySearch::Setup.config do
		setup_tables do
			projects :cn_name,:en_name
			items :title, :stitle, :tags, :info
			photos   :title
		end
	end