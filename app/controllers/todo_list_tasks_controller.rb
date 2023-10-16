class TodoListTasksController < ApplicationController
  before_action :set_todo_list_task, only: %i[ show edit update destroy ]

  # GET /todo_list_tasks or /todo_list_tasks.json
  def index
    @todo_list_tasks = current_user.todo_list_tasks
    @todo_list_task = current_user.todo_list_tasks.build
  end

  # GET /todo_list_tasks/1 or /todo_list_tasks/1.json
  def show
  end

  # GET /todo_list_tasks/new
  def new
  end

  # GET /todo_list_tasks/1/edit
  def edit
  end

  # POST /todo_list_tasks or /todo_list_tasks.json
  def create
    @todo_list_task = TodoListTask.new(todo_list_task_params)
    @todo_list_task.user = current_user

    respond_to do |format|
      if @todo_list_task.save
        format.html { redirect_to todo_list_task_url(@todo_list_task), notice: "Todo list task was successfully created." }
        format.json { render :show, status: :created, location: @todo_list_task }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @todo_list_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_list_tasks/1 or /todo_list_tasks/1.json
  def update
    respond_to do |format|
      if @todo_list_task.update(todo_list_task_params)
        format.html { redirect_to todo_list_task_url(@todo_list_task), notice: "Todo list task was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_list_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_list_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def move_to_completed
    @todo_list_task = TodoListTask.find(params[:id])
    @todo_list_task.update(completed: true)

    # Optionally, you can redirect to a completed items page or do other actions here.
  end

  # DELETE /todo_list_tasks/1 or /todo_list_tasks/1.json
  def destroy
    if
    @todo_list_task.destroy

    respond_to do |format|
      format.html { redirect_to todo_list_tasks_url, notice: "Todo list task was successfully destroyed." }
      format.json { head :no_content }
    end
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list_task
      @todo_list_task = TodoListTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_list_task_params
      params.require(:todo_list_task).permit(:title, :description, :due_date, :completed).merge(user_id: current_user.id)
    end
end
