class CreateListings < ActiveRecord::Migration[5.0]
  def change
  	create_table :listings do |t|
  		t.string :name
  		t.decimal :lat
  		t.decimal :lng
  		t.string :city 
  		t.string :neighborhood
  		t.integer :rate
  		t.string :room_type
  		t.integer :bedrooms
  		t.integer :beds
  		t.integer :bathrooms
  		t.timestamps
  	end
  end
end
