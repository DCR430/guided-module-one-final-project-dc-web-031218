class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing

	def self.reservation_header
		str = <<-HEREDOC
	##########################################################################
	#                            Flatiron BnB                                #
	#-------------------------------------------------------------------------
	#                                                                        #
	#                      Your reservations!                                #
	#                                                                        #
	##########################################################################
		HEREDOC
		printf str + "\n\n"
	end

	def self.reservations_by_user(user_obj)
		coll = user_obj.reservations

		if coll.empty?
			puts "You have no reservations!"
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


	end

end