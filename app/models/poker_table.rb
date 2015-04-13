class PokerTable < ActiveRecord::Base
  serialize :seats,Array
end
