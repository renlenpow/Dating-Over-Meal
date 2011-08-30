class AddRatingAverageToPlaces < ActiveRecord::Migration
  def up
    add_column :places, :rating_average, :decimal, :default => 0, :precision => 6, :scale => 2, :after => :scrape_image_url
  end
  
  def down
    remove_column :places, :rating_average
  end
end
