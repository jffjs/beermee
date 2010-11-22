class RenameInfoToDescriptionInBreweries < ActiveRecord::Migration
  def self.up
    rename_column :breweries, :info,  :description
  end

  def self.down
    rename_column :breweries, :description,  :info
  end
end
