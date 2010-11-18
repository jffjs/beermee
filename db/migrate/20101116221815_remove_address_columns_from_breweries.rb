class RemoveAddressColumnsFromBreweries < ActiveRecord::Migration
  def self.up
    remove_column :breweries, :city
    remove_column :breweries, :country_id
    remove_column :breweries, :state_id
    remove_column :breweries, :zipcode
    remove_column :breweries, :address
  end

  def self.down
    add_column :breweries, :address,    :string
    add_column :breweries, :zipcode,    :string
    add_column :breweries, :state_id,   :integer
    add_column :breweries, :country_id, :integer
    add_column :breweries, :city,       :string
  end
end
