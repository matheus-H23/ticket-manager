class Manager::UsersController < ApplicationController

  layout 'manager'

  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]
  before_action :options_for_select, only: %i[new create edit show]

  def index
    @users = User.where.not(id: 1).order(:id).page(params[:page]).per(10)
  end

  def show
    @tickets = @user.tickets.order(:id).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.hex(20)
    respond_to do |format|
      if @user.save
        format.html
          redirect_to manager_users_path,
          notice: 'User was successfully created.'
        format.json render :show, status: :created, location: @user
      else
        format.html render :new
        format.json render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def edit
    # code
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html
          redirect_to manager_users_path,
          notice: 'User was successfully updated.'
        format.json render :show, status: :ok, location: @user
      else
        format.html render :edit
        format.json render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @user.destroy
      redirect_to manager_users_path, notice: 'User deleted successfully'
    else
      redirect_to manager_users_path, notice: 'User cannot be deleted!'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
      params.require(:user).permit(:name, :email, :group_id, :test, :active)
    else
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :test, :active)
    end
  end

  def options_for_select
    @groups_options_for_select = Group.all
  end
end
