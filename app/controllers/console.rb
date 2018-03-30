class Console

	def execute
		#1) Can create user objects, access them from console
		current_user = self.user

		#Can create queries

		#3) Can create reservations
		self.repl(current_user)
	end

	# Adapted from: http://www.rubyguides.com/2016/07/writing-a-shell-in-ruby/
	def repl(user_obj)
		self.repl_greeting

		while input = Readline.readline("> ", true)

			break if input == "exit"
			case input 
			when 'query', 'Query' 
				puts "Query!\n\n"
				le_query = Query.new(user_obj)
				le_query.execute

			when 'reservations', 'reservation', 'Reservations'
				puts "Reservations!\n\n"
			else
				puts "Invalid input, please enter 'query', 'reservations', or 'exit\n\n"
			end

		end
	end

	def user
		self.user_greeting
		username = gets.chomp 
		temp = User.find_or_create_by(username: username)
		puts "\nUsername inputed: #{username}\n\n"
		if !temp.name
			puts "New User detected! Please enter your name: \n\n"
			temp.name = gets.chomp
			temp.save
			puts "\n\nHello, #{temp.name}! Thank you for joining."
		else
			puts "Welcome back, #{temp.name}!\n\n"
		end
		temp 
	end


	def user_greeting
		str = <<-HEREDOC
	##########################################################################
	#                            Flatiron BnB                                #
	#-------------------------------------------------------------------------
	#                                                                        #
	#    Welcome to Flatiron BnB! Please enter/create a user name.           #
	#                                                                        #
	##########################################################################
		HEREDOC
		printf str + "\n\n"
	end


	def repl_greeting
		str = <<-HEREDOC
	##########################################################################
	#                            Flatiron BnB                                #
	#-------------------------------------------------------------------------
	#                                                                        #
	#    Welcome to the terminal! From here you can do the following:        #
	#       1) Type 'query' to make a query/reservation.                     #
	#       2) Type 'reservations' to see your reservations                  #
	#       3) Type 'exit' to exit the program                               #
	#                                                                        #
	#                                                                        #
	##########################################################################
		HEREDOC

		printf str + "\n\n"
	end


end #end class
