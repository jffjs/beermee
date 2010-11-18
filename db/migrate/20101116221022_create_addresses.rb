class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :state_id
      t.integer :country_id
      t.string :postal_code

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
