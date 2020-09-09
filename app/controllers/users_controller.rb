class UsersController < ApplicationController
  def index
    
  end
  
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
      render 'new'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:account_id, :email, :password, :password_confirmation,
      :first_name, :last_name, :first_name_kana, :last_name_kana, :first_name_roman, :last_name_roman,
    :birthday, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :nickname)
  end
end
