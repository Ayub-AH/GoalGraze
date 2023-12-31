class MonthlyGoalsController < ApplicationController
  before_action :set_monthly_goal, only: %i[ show edit update destroy ]

  # GET /monthly_goals or /monthly_goals.json
  def index
    @monthly_goals = MonthlyGoal.all
    @monthly_goal = MonthlyGoal.new
  end

  # GET /monthly_goals/1 or /monthly_goals/1.json
  def show
  end

  # GET /monthly_goals/new
  def new
    @monthly_goal = MonthlyGoal.new
  end

  # GET /monthly_goals/1/edit
  def edit
  end

  # POST /monthly_goals or /monthly_goals.json
  def create
    @monthly_goal = MonthlyGoal.new(monthly_goal_params)
    @monthly_goal.user = current_user


    respond_to do |format|
      if @monthly_goal.save
        format.html { redirect_to monthly_goal_url(@monthly_goal), notice: "Monthly goal was successfully created." }
        format.json { render :show, status: :created, location: @monthly_goal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monthly_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_goals/1 or /monthly_goals/1.json
  def update
    respond_to do |format|
      if @monthly_goal.update(monthly_goal_params)
        format.html { redirect_to monthly_goal_url(@monthly_goal), notice: "Monthly goal was successfully updated." }
        format.json { render :show, status: :ok, location: @monthly_goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @monthly_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_goals/1 or /monthly_goals/1.json
  def destroy
    @monthly_goal.destroy

    respond_to do |format|
      format.html { redirect_to monthly_goals_url, notice: "Monthly goal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_goal
      @monthly_goal = MonthlyGoal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monthly_goal_params
      params.require(:monthly_goal).permit(:title, :description, :priority)
    end
end
