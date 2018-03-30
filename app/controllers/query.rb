class Query
	attr_reader :user
	def initialize(user)
		@user = user
	end

	def execute
		self.query_greeting
		begin
			search_hash = self.get_query
			results = search(search_hash)
			print_results(results)
			if !results.empty?
				make_reservation(results)
			end

		rescue => e
			puts "Invalid query! returning to the terminal"
			return
		end

		#self.search_hash
	end


	def print_results(coll)
		if coll.empty?
			puts "No returned matches!"
			puts "Hint: format searches as - city:str, bedrooms:int..."
			return
		end

		i = 0
		coll.each do |obj|
			puts "#{i}) ----------------------------------------------------------"
			puts "name: #{obj.name}, city: #{obj.city}"
			puts "neighborhood: #{obj.neighborhood} rate: #{obj.rate}"
			puts "\n\n"
			i+= 1 
		end 
	end


	def make_reservation(coll)
		self.res_greeting
		puts "reservation>"
		input = gets.chomp

		return if input == "exit"

		arr = input.split(",")

		if arr.length !=3
			puts "Invalid reservation input"
			return
		end

		begin
			res = Reservation.create(user: self.user, listing: coll[arr[0].to_i],
			 start_date: Date.parse(arr[1]), end_date: Date.parse(arr[2]))
			puts "Reservation made!"
		rescue => e
			puts "Error in creating reservation. Returning to terminal"
			puts e
		end
	end


	def search(search_hash)

		if search_hash[:beds]
			search_hash[:beds] = search_hash[:beds].to_i
		end

		if search_hash[:bedrooms]
			search_hash[:bedrooms] = search_hash[:bedrooms].to_i
		end
		Listing.where(search_hash)

	end

	#Gets query, converts to hash
	def get_query
		puts "query>"
		query = gets.chomp
		query.sub(/(?<=:)\s/, '')
		query_hash = Hash[query.split(",").map(&:strip).map { |p| p.split(":") }.map { |k, v| [ k.to_sym, v] }]

	end

	def res_greeting
		str = <<-HEREDOC
	##########################################################################
	#                            Make  Reservations                          #
	#-------------------------------------------------------------------------
	#   To Make a reservation, enter the following info based on your        #
	#   search results:                                                      #
	#     <result number>, <start_date>, <end_date>                          #
	#                                                                        #
	#   Format dates as: dd/mm/yyyy                                          #       
	#   To exit: exit                                                        #
	##########################################################################
		HEREDOC

		printf str + "\n\n"
	end


	def query_greeting

		str = <<-HEREDOC
	##########################################################################
	#                            Search Listings                             #
	#-------------------------------------------------------------------------
	#                                                                        #
	#    Please enter a search query! Query entries should be formatted as   #
	#    " <field>: <value> " and separated by a ',' between each pair.      #
	#    i.e. city:Washington, bedrooms:2.                                   #       
	#                                                                        #
	#       - Fields: city: str, neighborhood: str, bedrooms: int, beds: int #
	#       - Any number of fields can be added                              #
	#       - Cities include: Washington, Los Angeles, New York              #
	#                                                                        #
	##########################################################################
		HEREDOC

		printf str + "\n\n"

	end


end