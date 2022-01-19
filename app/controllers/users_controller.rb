# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
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