class User < ActiveRecord::Base
	has_many :listings, through: :reservations
	has_many :reservations
end