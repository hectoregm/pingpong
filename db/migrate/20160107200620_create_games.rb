class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :played
      t.integer :player_one
      t.integer :player_two
      t.integer :player_one_score
      t.integer :player_two_score

      t.timestamps null: false
    end
  end
end
