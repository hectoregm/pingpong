class AddDefaultsForGame < ActiveRecord::Migration
  def change
    change_column_default :games, :winner_score, 0
    change_column_default :games, :loser_score, 0
  end
end
