require_relative '../config/environment'
require "pry"

def greeting
	puts "Hello! Welcome to Flatiron BnB!"
end

def query 
	puts "Enter a city (DC, LA, or NYC):"
	loc = gets.chomp
	if loc == "DC" || loc == "dc"
		dc = Listing.all.map do |listing|
			binding.pry
			listing.city == "Washington"
		end
		puts dc
	elsif loc == "LA" || loc == "la"
		la = Listing.all.map do |listing|
			listing.city == "Los Angeles, CA"
		end
		puts la
	elsif loc == "NYC" || loc == "nyc"
		nyc = Listing.all.map do |listing|
			if listing.city == "New York"
				listing
			end
		end
		nyc = nyc.compact
		puts "New York City: Listings #{nyc.size}"
		nyc.each do |listing|
			puts "Name:#{listing.name}"
			puts "ID: #{listing.id}" 
			puts "Latitude:#{listing.lat}"
			puts "Longitude:#{listing.lng}"
			puts "City:#{listing.city}"
			puts "Neighborhood:#{listing.neighborhood}"
			puts "Rate: #{listing.rate}"
			puts "Room Type: #{listing.room_type}"
			puts "Bedrooms: #{listing.bedrooms}"
			puts "Beds:#{listing.beds}"
			puts "Bathrooms: #{listing.bathrooms}"
			puts "---------------------------------"
		end
	else
		query
	end
end

greeting
query