#Paths
dcpath = 'db/abnb_data/DC_data.json'
lapath = 'db/abnb_data/LA_data.json'
nycpath = 'db/abnb_data/NYC_data.json'

#Seeds DC Data
def seed_DC(filepath)
	file = File.read(filepath)
	data_hash = JSON.parse(file)["taskCollectionResults"][0]["results"]
	#vars for cols
	data_hash.each do |hash|
		id = hash["object"]["listing"][0]["id"]
		name = hash["object"]["listing"][0]["name"]
		lat = hash["object"]["listing"][0]["lat"]
		lng = hash["object"]["listing"][0]["lng"]
		city = hash["object"]["listing"][0]["city"]
		neighborhood = hash["object"]["listing"][0]["neighborhood"]
		rate = hash["object"]["pricing_quote"][0]["rate"][0]["amount"]
		room_type =   hash["object"]["listing"][0]["room_type"]
		bedrooms = hash["object"]["listing"][0]["bedrooms"]
		beds = hash["object"]["listing"][0]["beds"]
		bathrooms = hash["object"]["listing"][0]["bathrooms"]

		temp_hash = {
			:id => id, 
			:name => name,
			:lat => lat,
			:lng => lng,
			:city => city,
			:neighborhood => neighborhood,
			:rate => rate,
			:room_type => room_type,
			:bedrooms => bedrooms,
			:beds => beds,
			:bathrooms => bathrooms
		}
		Listing.create(temp_hash)
	end
end

def seed_LANYC(filepath)

	file = File.read(filepath)
	data_hash = JSON.parse(file)
	listing_arr = data_hash["explore_tabs"][0]["sections"][0]["listings"]

	listing_arr.each do |hash|
		id = hash["listing"]["id"]
		name = hash["listing"]["name"]
		lat = hash["listing"]["lat"]
		lng = hash["listing"]["lng"]  #
		city = hash["listing"]["city"] #
		neighborhood = hash["listing"]["neighborhood"] #
		rate = hash["pricing_quote"]["rate"]["amount"] #
		room_type = hash["listing"]["room_type"]
		bedrooms = hash["listing"]["bedrooms"]
		beds = hash["listing"]["beds"]
		bathrooms = hash["listing"]["bathrooms"]

		temp_hash = {
			:id => id, 
			:name => name,
			:lat => lat,
			:lng => lng,
			:city => city,
			:neighborhood => neighborhood,
			:rate => rate,
			:room_type => room_type,
			:bedrooms => bedrooms,
			:beds => beds,
			:bathrooms => bathrooms
		}

		Listing.create(temp_hash)
	end
	
end


seed_DC(dcpath)
seed_LANYC(lapath)
seed_LANYC(nycpath)
