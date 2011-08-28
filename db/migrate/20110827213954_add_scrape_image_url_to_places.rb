class AddScrapeImageUrlToPlaces < ActiveRecord::Migration
  def up
    add_column :places, :scrape_image_url, :string, :after => :description
  end
  
  def down
    remove_column :places, :scrape_image_url
  end
end
