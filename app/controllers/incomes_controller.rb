class IncomesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_income, only: %i[show edit update destroy]

  def index
    @incomes = current_user.incomes.paginate(page: params[:page]).order('created_at DESC')
  end

  def show
  end

  def new
    @income = current_user.incomes.new
  end

  def create
    @income = current_user.incomes.new(income_params)

    respond_to do |format|
      if @income.save
        format.html { redirect_to @income, notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to @budget, notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_income
      @income = current_user.incomes.find(params[:id])
    end

    def income_params
      params.require(:income).permit(:title, :description, :amount, :received_date, :user_id, :frequency_id)
    end
end

