class CreateLeaguePlayers < ActiveRecord::Migration
  def change
    create_table :league_players do |t|
      t.references :league, index: true
      t.references :player, index: true

      t.decimal :score, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
