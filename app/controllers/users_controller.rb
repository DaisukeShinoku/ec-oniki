class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ONK Shoppingへようこそ!!"
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "登録情報を更新しました"
      redirect_to @user
    else
      flash.now[:danger] = '登録情報の更新に失敗しました'
      render 'edit'
    end
  end
  
  
  private

  def user_params
    params.require(:user).permit(:account_id, :email, :password, :password_confirmation,
      :first_name, :last_name, :first_name_kana, :last_name_kana, :first_name_roman, :last_name_roman,
    :birthday, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :nickname)
  end

end
