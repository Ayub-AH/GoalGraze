require "test_helper"

class TodoListTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_list_task = todo_list_tasks(:one)
  end

  test "should get index" do
    get todo_list_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_list_task_url
    assert_response :success
  end

  test "should create todo_list_task" do
    assert_difference("TodoListTask.count") do
      post todo_list_tasks_url, params: { todo_list_task: { description: @todo_list_task.description, due_date: @todo_list_task.due_date, title: @todo_list_task.title, user_id: @todo_list_task.user_id } }
    end

    assert_redirected_to todo_list_task_url(TodoListTask.last)
  end

  test "should show todo_list_task" do
    get todo_list_task_url(@todo_list_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_list_task_url(@todo_list_task)
    assert_response :success
  end

  test "should update todo_list_task" do
    patch todo_list_task_url(@todo_list_task), params: { todo_list_task: { description: @todo_list_task.description, due_date: @todo_list_task.due_date, title: @todo_list_task.title, user_id: @todo_list_task.user_id } }
    assert_redirected_to todo_list_task_url(@todo_list_task)
  end

  test "should destroy todo_list_task" do
    assert_difference("TodoListTask.count", -1) do
      delete todo_list_task_url(@todo_list_task)
    end

    assert_redirected_to todo_list_tasks_url
  end
end
