require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  test "the deck is the right size" do
    d = Deck.new
    assert_equal 52, d.cards.length
  end
  # test "the truth" do
  #   assert true
  # end
end
