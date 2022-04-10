# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i(edit update show destroy)
  before_action :require_user, except: %i(index show)
  before_action :require_same_user, only: %i(edit update destroy)
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    return render "new" unless @article.save

    flash[:notice] = "Article was created successfully!"
    redirect_to @article
  end

  def edit; end

  def update
    return render "new" unless @article.update(article_params)

    flash[:notice] = "Article was updated successfully!"
    redirect_to @article
  end

  def destroy
    @article.destroy!
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    return if @article.user == current_user
    flash[:alert] = "You can only edit or delete your own articles"
    redirect_to @article
  end
end
