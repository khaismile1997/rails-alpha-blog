# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    return render "edit" unless @user.update(user_params)

    flash[:notice] = "Your information was successful updated!"
    redirect_to @user
  end

  def create
    @user = User.new(user_params)
    return render "new" unless @user.save
    flash[:notice] = "Welcome to Alpha Blog #{@user.username}! You have successful signup!"
    redirect_to articles_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
