class CreateReservations < ActiveRecord::Migration[5.0]
  def change
  	create_table :reservations do |t|
  		t.integer :user_id
  		t.integer :listing_id
  		t.datetime :start_date
  		t.datetime :end_date
  		t.integer :rate 
  	end
  end
end
