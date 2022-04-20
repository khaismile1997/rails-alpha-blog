# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i(edit update show)
  before_action :require_admin, except: %i(index show)
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render "new"
    end
  end

  def update
    return render "edit" unless @category.update(category_params)

    flash[:notice] = "Category was updated successfully!"
    redirect_to @category
  end

  private
  def set_category
    @category ||= Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    return if logged_in? && current_user.admin?
    flash[:alert] = "Only admin can perform that action"
    redirect_to categories_path
  end
end
