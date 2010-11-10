class AddImageColumnToBreweries < ActiveRecord::Migration
  def self.up
    add_column  :breweries, :image_file_name,     :string
    add_column  :breweries, :image_content_type,  :string
    add_column  :breweries, :image_file_size,     :string
    add_column  :breweries, :image_updated_at,    :datetime
  end

  def self.down
    remove_column :breweries, :image_updated_at
    remove_column :breweries, :image_file_size
    remove_column :breweries, :image_content_type
    remove_column :breweries, :image_file_name
  end
end
