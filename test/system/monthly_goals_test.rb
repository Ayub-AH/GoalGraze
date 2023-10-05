require "application_system_test_case"

class MonthlyGoalsTest < ApplicationSystemTestCase
  setup do
    @monthly_goal = monthly_goals(:one)
  end

  test "visiting the index" do
    visit monthly_goals_url
    assert_selector "h1", text: "Monthly goals"
  end

  test "should create monthly goal" do
    visit monthly_goals_url
    click_on "New monthly goal"

    fill_in "Description", with: @monthly_goal.description
    fill_in "Title", with: @monthly_goal.title
    fill_in "User", with: @monthly_goal.user_id
    click_on "Create Monthly goal"

    assert_text "Monthly goal was successfully created"
    click_on "Back"
  end

  test "should update Monthly goal" do
    visit monthly_goal_url(@monthly_goal)
    click_on "Edit this monthly goal", match: :first

    fill_in "Description", with: @monthly_goal.description
    fill_in "Title", with: @monthly_goal.title
    fill_in "User", with: @monthly_goal.user_id
    click_on "Update Monthly goal"

    assert_text "Monthly goal was successfully updated"
    click_on "Back"
  end

  test "should destroy Monthly goal" do
    visit monthly_goal_url(@monthly_goal)
    click_on "Destroy this monthly goal", match: :first

    assert_text "Monthly goal was successfully destroyed"
  end
end
