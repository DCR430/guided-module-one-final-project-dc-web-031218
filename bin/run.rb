require_relative 'config/environment'

def greeting
	puts "Hello! Welcome to Flatiron BnB!"
end

def query 
	puts "Enter a city (DC, LA, or NYC):"
	loc = gets.chomp
	if loc == "DC" || loc == "dc"
		seedDC(dcpath)
	elsif loc == "LA" || loc == "la"
		seedLANYC(lapath)
	elsif loc == "NYC" || loc == "nyc"
		seedLANYC(nycpath)
	else
		query
	end
end

