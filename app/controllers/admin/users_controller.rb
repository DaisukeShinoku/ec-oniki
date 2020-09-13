class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  before_action :check_guest, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render action: :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:account_id, :email, :password, :password_confirmation,
      :first_name, :last_name, :first_name_kana, :last_name_kana, :first_name_roman, :last_name_roman,
    :birthday, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :nickname, :is_valid)
  end
end
