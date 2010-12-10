class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :place_id
      t.integer :beer_id
      t.integer :trackable_id
      t.string  :trackable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
