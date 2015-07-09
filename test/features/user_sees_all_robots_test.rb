require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def test_user_sees_index_of_robots
    visit '/robots'
    within 'h1' do
      assert page.has_content?("Robot Roster")
    end
  end
end
