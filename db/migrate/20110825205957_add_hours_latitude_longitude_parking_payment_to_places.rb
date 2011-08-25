class AddHoursLatitudeLongitudeParkingPaymentToPlaces < ActiveRecord::Migration
  def up
    add_column :places, :latitude, :float, :after => :zipcode
    add_column :places, :longitude, :float, :after => :latitude
    add_column :places, :hours, :text, :after => :longitude
    add_column :places, :parking, :text, :after => :hours
    add_column :places, :payment, :text, :after => :parking
  end
  
  def down
    remove_column :places, :latitude
    remove_column :places, :longitude
    remove_column :places, :hours
    remove_column :places, :parking
    remove_column :places, :payment
  end
end
