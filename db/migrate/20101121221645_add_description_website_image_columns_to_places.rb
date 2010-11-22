class AddDescriptionWebsiteImageColumnsToPlaces < ActiveRecord::Migration
  def self.up
    add_column  :places,  :description,         :text
    add_column  :places,  :website,             :string
    add_column  :places,  :image_file_name,     :string
    add_column  :places,  :image_content_type,  :string
    add_column  :places,  :image_file_size,     :string
    add_column  :places,  :image_updated_at,    :datetime
  end

  def self.down
    remove_column :places,  :image_updated_at
    remove_column :places,  :image_file_size
    remove_column :places,  :image_content_type
    remove_column :places,  :image_file_name
    remove_column :places,  :website
    remove_column :places,  :description
  end
end
