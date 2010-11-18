class AddBreweryIdColumnToAddresses < ActiveRecord::Migration
  def self.up
    add_column  :addresses, :brewery_id,  :integer
  end

  def self.down
    remove_column :addresses, :brewery_id
  end
end
