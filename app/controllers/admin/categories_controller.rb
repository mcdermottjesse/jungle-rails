class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    # @category = Category.new
  end

  def create
  end
  # private

  # def category_params
  #   params.require(:category).permit(
  #     :name
  #   )
  # end
end