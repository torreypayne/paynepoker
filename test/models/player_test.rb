require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  def setup
    @player = Player.new(username: 'example', email: 'user@example.com')
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
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @player.email = valid_address
      assert @player.valid?, "#{valid_address.inspect} should be valid"
    end
  end
    
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @player.email = invalid_address
      assert_not @player.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @player.dup
    duplicate_user.email = @player.email.upcase
    @player.save
    assert_not duplicate_user.valid?
  end
end
