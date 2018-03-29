require_relative '../config/environment'
require "pry"

def greeting
	puts "Hello! Welcome to Flatiron BnB!"
	puts "Enter 1 to search"
end

def query 
	puts "Enter a city (DC, LA, or NYC):"
	loc = gets.chomp
	if loc == "DC" || loc == "dc"
		dc = Listing.all.map do |listing|
			if listing.city == "Washington"
				listing
			end
		end
		dc = dc.compact
		puts "DC: Listings #{dc.size}"
		dc.each do |listing|
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
	elsif loc == "LA" || loc == "la"
		la = Listing.all.map do |listing|
			if listing.city == "Los Angeles"
				listing
			end
		end
		la = la.compact
		puts "LA: Listings #{la.size}"
		la.each do |listing|
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
input = gets.chomp 
if input == "1"
	query
else
	greeting
end

