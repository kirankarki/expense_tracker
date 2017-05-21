class ExpensesController < ApplicationController

  before_action :authenticate_user!
  before_action :load_budget
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = load_budget.expenses.paginate(page: params[:page]).order('created_at DESC')
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = load_budget.expenses.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = load_budget.expenses.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to budget_expense_path(@budget, @expense), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: budget_expense_path(@budget, @expense) }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to budget_expense_path(@budget, @expense), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: budget_expense_path(@budget, @expense) }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to budget_expenses_url(@budget), notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def load_budget
      @budget ||= Budget.find(params[:budget_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = load_budget.expenses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:title, :description, :amount, :spent_date, :budget_id)
    end
end
