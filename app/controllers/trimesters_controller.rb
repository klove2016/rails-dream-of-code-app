class TrimestersController < ApplicationController
  before_action :set_trimester, only: [:edit, :update, :show]

  def index
    @trimesters = Trimester.all
  end
  
  def show
  end

  # GET /trimesters/new
  def new
    @trimester = Trimester.new
  end

  # POST /trimesters
  def create
    @trimester = Trimester.new(trimester_params)
    if @trimester.save
      redirect_to @trimester, notice: "Trimester was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @trimester is already set by before_action
  end

  # PATCH/PUT /trimesters/:id
  def update
    if @trimester.update(trimester_params)
      redirect_to @trimester, notice: "Trimester was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trimester = Trimester.find(params[:id])
    @trimester.destroy
    redirect_to trimesters_path, notice: "Trimester deleted."
  end


  private

  def set_trimester
    @trimester = Trimester.find(params[:id])
  end

  def trimester_params
    params.require(:trimester).permit(:term, :year, :start_date, :end_date, :application_deadline)
  end
end
