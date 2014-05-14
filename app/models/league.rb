class League < ActiveRecord::Base
  has_many :games
  has_many :league_players
  has_many :players, through: :league_players

  validates_presence_of :name
  validates_length_of :name, within: 1..200
end

# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
