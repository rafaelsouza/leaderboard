class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :league_id, null: false
      t.integer :home_player_id, null: false
      t.integer :away_player_id, null: false
      t.decimal :home_score, :precision => 10, :scale => 2, null: false
      t.decimal :away_score, :precision => 10, :scale => 2, null: false

      t.timestamps
    end

    add_index :games, :league_id
    add_index :games, :home_player_id
    add_index :games, :away_player_id
  end
end
