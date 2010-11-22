class RenameBreweryIdToAddressableIdInAddresses < ActiveRecord::Migration
  def self.up
    rename_column :addresses, :brewery_id, :addressable_id
    add_column    :addresses, :addressable_type, :string
  end

  def self.down
    remove_column :addresses, :addressable_type
    rename_column :addresses, :addressable_id, :brewery_id
  end
end
