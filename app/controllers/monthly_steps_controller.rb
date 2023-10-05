class MonthlyStepsController < ApplicationController
  before_action :set_monthly_step, only: %i[ show edit update destroy ]

  # GET /monthly_steps or /monthly_steps.json
  def index
    @monthly_steps = MonthlyStep.all
  end

  # GET /monthly_steps/1 or /monthly_steps/1.json
  def show
  end

  # GET /monthly_steps/new
  def new
    @monthly_step = MonthlyStep.new
  end

  # GET /monthly_steps/1/edit
  def edit
  end

  # POST /monthly_steps or /monthly_steps.json
  def create
    @monthly_step = MonthlyStep.new(monthly_step_params)

    respond_to do |format|
      if @monthly_step.save
        format.html { redirect_to monthly_step_url(@monthly_step), notice: "Monthly step was successfully created." }
        format.json { render :show, status: :created, location: @monthly_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monthly_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_steps/1 or /monthly_steps/1.json
  def update
    respond_to do |format|
      if @monthly_step.update(monthly_step_params)
        format.html { redirect_to monthly_step_url(@monthly_step), notice: "Monthly step was successfully updated." }
        format.json { render :show, status: :ok, location: @monthly_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @monthly_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_steps/1 or /monthly_steps/1.json
  def destroy
    @monthly_step.destroy

    respond_to do |format|
      format.html { redirect_to monthly_steps_url, notice: "Monthly step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_step
      @monthly_step = MonthlyStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monthly_step_params
      params.require(:monthly_step).permit(:title, :description, :due_date, :monthly_goals_id)
    end
end
