require "application_system_test_case"

class TodoListTasksTest < ApplicationSystemTestCase
  setup do
    @todo_list_task = todo_list_tasks(:one)
  end

  test "visiting the index" do
    visit todo_list_tasks_url
    assert_selector "h1", text: "Todo list tasks"
  end

  test "should create todo list task" do
    visit todo_list_tasks_url
    click_on "New todo list task"

    fill_in "Description", with: @todo_list_task.description
    fill_in "Due date", with: @todo_list_task.due_date
    fill_in "Title", with: @todo_list_task.title
    fill_in "User", with: @todo_list_task.user_id
    click_on "Create Todo list task"

    assert_text "Todo list task was successfully created"
    click_on "Back"
  end

  test "should update Todo list task" do
    visit todo_list_task_url(@todo_list_task)
    click_on "Edit this todo list task", match: :first

    fill_in "Description", with: @todo_list_task.description
    fill_in "Due date", with: @todo_list_task.due_date
    fill_in "Title", with: @todo_list_task.title
    fill_in "User", with: @todo_list_task.user_id
    click_on "Update Todo list task"

    assert_text "Todo list task was successfully updated"
    click_on "Back"
  end

  test "should destroy Todo list task" do
    visit todo_list_task_url(@todo_list_task)
    click_on "Destroy this todo list task", match: :first

    assert_text "Todo list task was successfully destroyed"
  end
end
