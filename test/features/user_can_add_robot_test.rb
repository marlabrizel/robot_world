require_relative '../test_helper'

class UserCanAddRobotTest < FeatureTest

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

  def test_a_user_can_create_a_new_robot_from_dashboard
    create_robots
    visit '/'
    click_link("Add a Robot")
    assert_equal "/robots/new", current_path

    fill_in('name', with: "Keller")
    fill_in('city', with: "Denver")
    fill_in('state', with: "CO")
    fill_in('birthdate', with: "2011-05-01")
    fill_in('date_hired', with: "2005-09-17")
    fill_in('department', with: "Derp")
    click_button("Create Bot")
    assert_equal '/robots', current_path

    within('#robot_roster') do
      assert page.has_content? "Keller"
    end
  end

  def test_a_user_can_create_a_new_robot_from_index
    visit '/robots'
    click_link("Add a Robot")
    assert_equal "/robots/new", current_path

    fill_in('name', with: "Keller")
    fill_in('city', with: "Denver")
    fill_in('state', with: "CO")
    fill_in('birthdate', with: "2011-05-01")
    fill_in('date_hired', with: "2005-09-17")
    fill_in('department', with: "Derp")
    click_button("Create Bot")
    assert_equal '/robots', current_path

    within('#robot_roster') do
      assert page.has_content? "Keller"
    end
  end
end
