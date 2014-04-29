class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title
      t.date :release_at
      t.string :summary
      t.string :rate
      t.integer :duration
      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
