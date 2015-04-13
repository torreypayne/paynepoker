require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  def setup
    @player = Player.new(username: 'example', email: 'player@example.com')
  end
  
  test "should be valid" do
    assert @player.valid?
  end
  
  test "name should be present" do
    @player.username = ""
    assert_not @player.valid?
  end
  
  test "email should be present" do
    @player.email = "    "
    assert_not @player.valid?
  end
  
  test "name should not be too long" do
    @player.username = "a" * 51
    assert_not @player.valid?
  end
  
  test "email should not be too long" do
    @player.email = "a" * 244 + "@example.com"
    assert_not @player.valid?
  end
end
