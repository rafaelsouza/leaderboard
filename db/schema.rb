# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140326032848) do

  create_table "games", force: true do |t|
    t.integer  "league_id",                               null: false
    t.integer  "home_player_id",                          null: false
    t.integer  "away_player_id",                          null: false
    t.decimal  "home_score",     precision: 10, scale: 2, null: false
    t.decimal  "away_score",     precision: 10, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["away_player_id"], name: "index_games_on_away_player_id"
  add_index "games", ["home_player_id"], name: "index_games_on_home_player_id"
  add_index "games", ["league_id"], name: "index_games_on_league_id"

  create_table "league_players", force: true do |t|
    t.integer  "league_id"
    t.integer  "player_id"
    t.decimal  "score",      precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "league_players", ["league_id"], name: "index_league_players_on_league_id"
  add_index "league_players", ["player_id"], name: "index_league_players_on_player_id"

  create_table "leagues", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
