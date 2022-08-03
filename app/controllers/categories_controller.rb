class CategoriesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def show; end

  def new
    @category = Category.new
  end
  
  # def edit; end
  
  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end
  
  # def update
  #   if @Category.update(category_params)
  #     redirect_to categories_url, notice: 'Category was successfully updated.'
  #   else
  #     flash[:notice] = 'Something went wrong.'
  #   end
  # end
  
  # def destroy
  #   @Category.destroy
  #     redirect_to categories_url, notice: 'Category was successfully destroyed.'
  # end
  
  private
  
  # def set_category
  #   @Category = Category.find(params[:id])
  # end
  
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
