require "test_helper"

class MonthlyStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly_step = monthly_steps(:one)
  end

  test "should get index" do
    get monthly_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_monthly_step_url
    assert_response :success
  end

  test "should create monthly_step" do
    assert_difference("MonthlyStep.count") do
      post monthly_steps_url, params: { monthly_step: { description: @monthly_step.description, due_date: @monthly_step.due_date, monthly_goals_id: @monthly_step.monthly_goals_id, title: @monthly_step.title } }
    end

    assert_redirected_to monthly_step_url(MonthlyStep.last)
  end

  test "should show monthly_step" do
    get monthly_step_url(@monthly_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthly_step_url(@monthly_step)
    assert_response :success
  end

  test "should update monthly_step" do
    patch monthly_step_url(@monthly_step), params: { monthly_step: { description: @monthly_step.description, due_date: @monthly_step.due_date, monthly_goals_id: @monthly_step.monthly_goals_id, title: @monthly_step.title } }
    assert_redirected_to monthly_step_url(@monthly_step)
  end

  test "should destroy monthly_step" do
    assert_difference("MonthlyStep.count", -1) do
      delete monthly_step_url(@monthly_step)
    end

    assert_redirected_to monthly_steps_url
  end
end
