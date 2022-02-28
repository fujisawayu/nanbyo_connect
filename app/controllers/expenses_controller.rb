class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[ show edit update destroy ]
  before_action :prohibit_access, only: %i[show edit update destroy ]

  def index
    @expenses = Expense.where(disease_id: params[:disease_id] ).order("created_at DESC").page(params[:page]).per(10)
    @disease = Disease.find(params[:disease_id])
  end

  def show
  end

  def new
    @disease = Disease.find(params[:disease_id])
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.disease_id = params[:disease_id]
    @disease = Disease.find(params[:disease_id])
    @expense.user_id = current_user.id
    respond_to do |format|
      if @expense.save
  
        format.html { redirect_to disease_expenses_path(@expense.disease_id), notice: "治療費情報を登録しました" }
        format.json { render :show, status: :created, location: @expense }
      else
        flash.now[:alert] = '未入力の項目があります'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to disease_expenses_path(@expense.disease_id), notice: "治療費情報を更新しました" }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to disease_expenses_path(@expense.disease_id), notice: "治療費情報を削除しました" }
      format.json { head :no_content }
    end
  end

  private
  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:treatment_cost, :drug_cost, :other_cost, :disease_id, :user_id)
  end
  
  def prohibit_access
    redirect_to  root_path, alert: 'アクセス権がありません' unless @expense.user_id == current_user.id
  end
end
