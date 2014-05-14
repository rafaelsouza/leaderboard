require 'spec_helper'

describe Game do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  home_player_id :integer
#  away_player_id :integer
#  home_score     :decimal(10, 2)
#  away_score     :decimal(10, 2)
#  created_at     :datetime
#  updated_at     :datetime
#
