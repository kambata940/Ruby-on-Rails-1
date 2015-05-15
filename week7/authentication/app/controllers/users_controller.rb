class UsersController < ApplicationController
  before_action :redirect_if_not_loged_in, only: [:show, :index]
  before_action :redirect_if_loged_in, only: [:sign_up, :sign_in]

  def show
    @user = User.find(session[:user_id])
  end

  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:user][:first_name],
                     last_name: params[:user][:last_name],
                     email: params[:user][:email],
                     password: params[:user][:password],
                     password_confirmation: params[:user][:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path
    else
      render :sign_up
    end
  end

  def sign_in
    @user = User.new
  end

  def checkout
    @user = User.find_by(email: params[:user][:email])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      render :show
    else
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to user_path
  end

end