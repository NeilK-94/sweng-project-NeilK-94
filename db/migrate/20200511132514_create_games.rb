class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.integer :score
      t.string :developer

      t.timestamps null: false
    end
  end
end
