class Account::UserController < ApplicationController

  layout "account"

  before_action :authenticate_user!
  before_action :set_user

  def edit
    #code
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to account_tickets_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
      params.require(:user).permit(:name, :email)
    else
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end

end
