class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing

	def self.execute(user_obj)
		self.reservation_header
		puts "reservations>"
		input = gets.chomp

		return if input == "exit"
		case input
		when 'list'
			self.reservations_by_user(user_obj)
		when 'ave rate'
			self.average_rate_by_user(user_obj)
		when 'delete'
			self.delete_reservation(user_obj)
		else
			puts "Invalid input! Returning to console"
			return
		end

	end


	def self.delete_reservation(user_obj)
		coll = self.reservations_by_user(user_obj)
		self.delete_header
		input = gets.chomp
		input = input.to_i
		begin
			reservation_id = coll[input].id
			user_obj.reservations.destroy(reservation_id)
			puts "Deleted reservation"
		rescue => e
			puts "Error in deleting reservation, returning to terminal"
			puts e
		end
	end



	def self.reservation_header
		str = <<-HEREDOC
	##########################################################################
	#                            Flatiron BnB                                #
	#-------------------------------------------------------------------------
	#   Welcome to your reservations! Here you can input:                    #
	#       1) 'list' to list your reservations                              #
	#       2) 'ave rate' to see the average rate of your stays              #
	#       3) 'delete' to delete a reservation                              #
	#       4) 'exit' to return to console                                   #
	#                                                                        #
	#                                                                        #
	##########################################################################
		HEREDOC
		printf str + "\n\n"
	end


	def self.delete_header
		str = <<-HEREDOC
	##########################################################################
	#                            Flatiron BnB                                #
	#-------------------------------------------------------------------------
	#   Removing a reservation? Here's how. From the above list, select the  #
	#   reservation you want to remove, and type its number listing          #
	#                                                                        #
	##########################################################################
		HEREDOC
		printf str + "\n\n"

	end


	def self.reservations_by_user(user_obj)
		coll = user_obj.reservations

		if coll.empty?
			puts "You have no reservations!"
			return
		end

		i = 0

		coll.each do |obj|
			puts "#{i}) ----------------------------------------------------------"
			puts "Check in: #{obj.start_date} Check out: #{obj.end_date}"
			puts "name: #{obj.listing.name}, city: #{obj.listing.city}"
			puts "neighborhood: #{obj.listing.neighborhood} rate: #{obj.listing.rate}"
			puts "\n\n"
			i+= 1 
		end 

		coll
	end



	def self.average_rate_by_user(user_obj)
		coll = user_obj.reservations

		if coll.empty?
			puts "You have no reservations!"
			return
		end 

		total = 0.0
		count = 0

		coll.each do |obj|
			if obj.rate != nil
				total += obj.rate 
				count += 1
			end
		end

		if count = 0 
			puts "Rates not listed for your reservations"
		else
			puts "Average Rate: #{total/count}"
		end
	end

end