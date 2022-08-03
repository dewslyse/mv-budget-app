class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:index, :new, :create]

  def index
    @expenses = @category.category_expenses.order(created_at: :desc)
  end

  def new
    @expense = Expense.new    
    @categories = current_user.categories
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    @category.expenses.push(@expense)
    
    if @expense.save
      redirect_to category_expenses_path, notice: 'Expense was successfully created.'
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
