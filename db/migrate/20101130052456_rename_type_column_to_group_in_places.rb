class RenameTypeColumnToGroupInPlaces < ActiveRecord::Migration
  def self.up
    rename_column :places, :type, :group
  end

  def self.down
    rename_column :places, :group, :type
  end
end
