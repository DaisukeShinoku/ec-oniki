class DestinationsController < ApplicationController
  before_action :logged_in_user
  before_action :dest_correct_user,   only: [:edit, :update, :destroy]

  def new
    @destination = Destination.new
  end
  
  def index
    @destinations = Destination.where(user_id: current_user.id)
  end
  
  def create
    @destination = Destination.new(destination_params)
    @destination.user_id = current_user.id
    if @destination.save
      flash[:success] = '登録住所の新規登録が完了しました'
      redirect_to destinations_url
    else
      flash.now[:danger] = '登録住所の新規登録に失敗しました'
      render :new
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      flash[:success] = '登録住所の更新が完了しました'
      redirect_to destinations_url
    else
      flash.now[:danger] = '登録住所の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    flash[:success] = '登録住所の削除が完了しました'
    redirect_to destinations_url
  end
  
  private

  def destination_params
    params.require(:destination).permit(:postcode, :prefecture_code, :address_city, :address_street, :address_building, :receiver)
  end

  def dest_correct_user
    @destination = current_user.destinations.find_by(id: params[:id])
    redirect_to root_url if @destination.nil?
  end
  
end
