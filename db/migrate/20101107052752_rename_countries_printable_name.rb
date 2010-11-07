class RenameCountriesPrintableName < ActiveRecord::Migration
  def self.up
    remove_column :countries, :name
    rename_column :countries, :printable_name, :name
  end

  def self.down
    rename_column :countries, :name, :printable_name
    add_column :countries, :name
  end
end
