class ChangeScoreColumnInRatings < ActiveRecord::Migration
  def self.up
    change_column :ratings, :score, :decimal
  end

  def self.down
    change_column :ratings, :score, :integer
  end
end
