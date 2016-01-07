class ModifyGameFields < ActiveRecord::Migration
  def change
    rename_column(:games, :played, :played_at)
    rename_column(:games, :player_one, :winner_id)
    rename_column(:games, :player_two, :loser_id)
    rename_column(:games, :player_one_score, :winner_score)
    rename_column(:games, :player_two_score, :loser_score)
  end
end
