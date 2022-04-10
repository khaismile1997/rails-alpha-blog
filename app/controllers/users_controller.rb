# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit; end

  def update
    return render "edit" unless @user.update(user_params)

    flash[:notice] = "Your information was successful updated!"
    redirect_to @user
  end

  def create
    @user = User.new(user_params)
    return render "new" unless @user.save
    session[:user_id] = @user.id
    flash[:notice] = "Welcome to Alpha Blog #{@user.username}! You have successful signup!"
    redirect_to articles_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
