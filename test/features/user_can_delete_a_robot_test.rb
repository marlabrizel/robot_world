require_relative '../test_helper'

class UserCanDeleteARobotTest < FeatureTest
  def create_robots
    RobotRepository.create({   :name       => "Riley",
                               :city       => "Denver",
                               :state      => "CO",
                               :birthdate  => "2005-02-01",
                               :date_hired => "2005-09-17",
                               :department => "Hospitality" })
  end

  def test_user_can_delete_a_robot
    create_robots
    visit '/robots'
    within 'h3' do
      assert page.has_content? "Riley"
    end

    click_button "Delete"
    assert_equal '/robots', current_path
    refute page.has_content? "Riley"
  end
end
