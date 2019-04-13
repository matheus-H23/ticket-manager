class Manager::UsersController < ApplicationController

  layout 'manager'

  before_action :authenticate_user!

  def index
    @users = User.where.not(id: 1).page(params[:page]).per(10)
  end

  def show
    #code
  end

  def new
    #code
  end

  def create
    #code
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
      params.require(:user).permit(:name, :email)
    else
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end

  def options_for_select
    @groups_options_for_select = Group.all
  end

end
