class RemoveTrackableColumnsAndAddUserColumnToActivities < ActiveRecord::Migration
  def self.up
    remove_column :activities, :trackable_id
    remove_column :activities, :trackable_type
    add_column    :activities, :user_id, :integer
  end

  def self.down
    remove_column :activities, :user_id
    add_column :activities, :trackable_type, :string
    add_column :activities, :trackable_id, :integer
  end
end
