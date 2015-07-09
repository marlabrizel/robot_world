require_relative '../test_helper'

class UserCanEditARobotTest < FeatureTest
  def create_robots
    1.times do
      RobotRepository.create({ :name       => "Riley",
                               :city       => "Denver",
                               :state      => "CO",
                               :birthdate  => "2005-02-01",
                               :date_hired => "2005-09-17",
                               :department => "Hospitality" })
    end
  end

  def test_a_user_can_edit_a_robot
    create_robots
    visit '/'
    click_link("Meet the Robots!")
    assert_equal "/robots", current_path

    click_link("Edit")
    fill_in('name', with: "Bentley")
    fill_in('city', with: "Denver")
    fill_in('state', with: "CO")
    fill_in('birthdate', with: "2011-05-01")
    fill_in('date_hired', with: "2005-09-17")
    fill_in('department', with: "Bakery")
    click_button("Update")

    within('h1') do
      assert page.has_content? "Meet Bentley!"
    end
  end
end
