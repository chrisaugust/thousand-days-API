require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      commitment_target: "100 Days of Meditation",
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  test "should be valid" do
    assert @user.valid?
  end

end
