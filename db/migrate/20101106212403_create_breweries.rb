class CreateBreweries < ActiveRecord::Migration
  def self.up
    create_table :breweries do |t|
      t.string  "name"
      t.string  "city"
      t.integer "country_id"
      t.integer "state_id"
      t.string  "zipcode"
      t.text    "info"
      t.string  "address"
      t.string  "website"

      t.timestamps
    end
  end

  def self.down
    drop_table :breweries
  end
end
