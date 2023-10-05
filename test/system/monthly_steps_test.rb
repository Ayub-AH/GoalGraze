require "application_system_test_case"

class MonthlyStepsTest < ApplicationSystemTestCase
  setup do
    @monthly_step = monthly_steps(:one)
  end

  test "visiting the index" do
    visit monthly_steps_url
    assert_selector "h1", text: "Monthly steps"
  end

  test "should create monthly step" do
    visit monthly_steps_url
    click_on "New monthly step"

    fill_in "Description", with: @monthly_step.description
    fill_in "Due date", with: @monthly_step.due_date
    fill_in "Monthly goals", with: @monthly_step.monthly_goals_id
    fill_in "Title", with: @monthly_step.title
    click_on "Create Monthly step"

    assert_text "Monthly step was successfully created"
    click_on "Back"
  end

  test "should update Monthly step" do
    visit monthly_step_url(@monthly_step)
    click_on "Edit this monthly step", match: :first

    fill_in "Description", with: @monthly_step.description
    fill_in "Due date", with: @monthly_step.due_date
    fill_in "Monthly goals", with: @monthly_step.monthly_goals_id
    fill_in "Title", with: @monthly_step.title
    click_on "Update Monthly step"

    assert_text "Monthly step was successfully updated"
    click_on "Back"
  end

  test "should destroy Monthly step" do
    visit monthly_step_url(@monthly_step)
    click_on "Destroy this monthly step", match: :first

    assert_text "Monthly step was successfully destroyed"
  end
end
