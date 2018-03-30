class Query

	def initialize(user)
		@user = user
	end

	def execute
		self.query_greeting
		begin
			search_hash = self.get_query
			results = search(search_hash)
			print_results(results)
		rescue => e
			puts "Invalid query! returning to the terminal"
			return
		end

		#self.search_hash
	end


	def print_results(coll)
		i = 0
		coll.each do |obj|
			puts "#{i}) ----------------------------------------------------------"
			puts "name: #{obj.name}, city: #{obj.city}"
			puts "neighborhood: #{obj.neighborhood} rate: #{obj.rate}"
			puts "/n/n"
			i+= 1 
		end 
	end


	def search(search_hash)
		Listing.where(search_hash)
	end

	#Gets query, converts to hash
	def get_query
		puts "query>"
		query = gets.chomp
		query_hash = query.split(" ").map{|x|x.split(":")}.map{|arr|[arr[0].to_sym, arr[1]]}.to_h
	end

	def query_greeting

		str = <<-HEREDOC
	##########################################################################
	#                            Search Listings                             #
	#-------------------------------------------------------------------------
	#                                                                        #
	#    Please enter a search query! Query entries should be formatted as   #
	#    " <field>:<value> " and separated by spaces between each pair.      #       
	#                                                                        #
	#       -Fields: city:str, neighborhood:str, bedrooms:int, beds:int      #
	#       -Any number of fields can be added                               #
	#       - Cities include: Washington, Los Angeles, New York              #
	#                                                                        #
	##########################################################################
		HEREDOC

		printf str + "\n\n"

	end


end