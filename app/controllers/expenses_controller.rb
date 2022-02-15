class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[  show edit update destroy ]

  def index
    @expenses = Expense.where(disease_id: params[:disease_id] )
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
    @expense.user_id = current_user.id

    respond_to do |format|
      if @expense.save
        format.html { redirect_to diseases_path(@expense.disease_id), notice: "Expense was successfully created." }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to disease_path(@expense.disease_id), notice: "Expense was successfully updated." }
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
      format.html { redirect_to disease_url, notice: "Expense was successfully destroyed." }
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
end
