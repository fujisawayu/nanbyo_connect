class SimulationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_simulation, only: %i[ show edit update destroy ]
  before_action :prohibit_access, only: %i[ index edit update destroy ]
  before_action :prohibit_show_access, only: %i[ show ]

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
    @simulation.user_id = current_user.id

    respond_to do |format|
      if @simulation.save
        format.html { redirect_to simulation_url(@simulation)}
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
        format.html { redirect_to simulation_url(@simulation), notice: "シミュレーション内容が更新されました" }
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
      format.html { redirect_to simulations_url, notice: "シミュレーション内容が削除されました" }
      format.json { head :no_content }
    end
  end

  private
  def set_simulation
    @simulation = Simulation.find(params[:id])
  end

  def simulation_params
    params.require(:simulation).permit(:diagnose_id, :severitie_id, :hierarchie_id, :long_term_id, :remark_id, :user_id)
  end

  def prohibit_access
    redirect_to  root_path, alert: 'アクセス権がありません' unless current_user.admin?
  end

  def prohibit_show_access
    redirect_to  root_path, notice: 'アクセス権がありません' unless @simulation.user_id == current_user.id
  end
end
