class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[ show edit update destroy ]

  # GET /feedbacks or /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1 or /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks or /feedbacks.json
 # app/controllers/feedbacks_controller.rb
def create
  # Check if a feedback already exists for the same month and user
  existing_feedback = Feedback.find_by(month: feedback_params[:month], user_id: current_user.id)

  if existing_feedback
    # Update the existing feedback
    if existing_feedback.update(feedback_params)
      redirect_to feedback_url(existing_feedback), notice: "Feedback was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  else
    # Create a new feedback if none exists for the same month and user
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user

    if @feedback.save
      redirect_to feedback_url(@feedback), notice: "Feedback was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
end


  # PATCH/PUT /feedbacks/1 or /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to feedback_url(@feedback), notice: "Feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1 or /feedbacks/1.json
  def destroy
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:title, :content, :month, :user_id)
    end
end
