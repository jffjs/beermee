class CreateBeers < ActiveRecord::Migration
  def self.up
    create_table :beers do |t|
      t.string  "name"
      t.integer "brewery_id"
      t.text    "description"
      t.decimal "abv"
      t.decimal "ibu"
      t.decimal "original_gravity"
      t.integer "style_id"
      t.string  "website"

      t.timestamps
    end
  end

  def self.down
    drop_table :beers
  end
end
