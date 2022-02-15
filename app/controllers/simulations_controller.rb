class SimulationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_simulation, only: %i[ show edit update destroy ]

  def index
    @simulations = Simulation.all
  end

  def show
  end

  def new
    @simulation = Simulation.new
  end

  def edit
  end

  def create
    @simulation = Simulation.new(simulation_params)

    respond_to do |format|
      if @simulation.save
        format.html { redirect_to simulation_url(@simulation), notice: "Simulation was successfully created." }
        format.json { render :show, status: :created, location: @simulation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @simulation.update(simulation_params)
        format.html { redirect_to simulation_url(@simulation), notice: "Simulation was successfully updated." }
        format.json { render :show, status: :ok, location: @simulation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @simulation.destroy

    respond_to do |format|
      format.html { redirect_to simulations_url, notice: "Simulation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_simulation
      @simulation = Simulation.find(params[:id])
    end

    def simulation_params
      params.require(:simulation).permit(:diagnose_id, :severitie_id, :hierarchie_id, :long_term_id, :remark_id)
    end
end
