class Listing < ActiveRecord::Base
	has_many :users, through: :reservations
	has_many :reservations
end