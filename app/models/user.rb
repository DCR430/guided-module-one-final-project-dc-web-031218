class User < ActiveRecord::Base
	has_many :listings, through: :reservations
	has_many :reservations

	def make_reservation(listing_obj)
		Reservation.create(user: self, listing: listing_obj)
	end
end