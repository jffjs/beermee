class AddImageColumnToBeer < ActiveRecord::Migration
  def self.up
    add_column  :beers, :image_file_name,     :string
    add_column  :beers, :image_content_type,  :string 
    add_column  :beers, :image_file_size,     :integer
    add_column  :beers, :image_updated_at,    :datetime
  end

  def self.down
    remove_column :beers, :image_updated_at
    remove_column :beers, :image_file_size
    remove_column :beers, :image_content_type
    remove_column :beers, :image_file_name
  end
end
