class CreateBeerLogs < ActiveRecord::Migration
  def self.up
    create_table :beer_logs do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :beer_logs
  end
end
