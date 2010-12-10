class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :beer_id
      t.integer :user_id
      t.integer :score
      t.string  :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
