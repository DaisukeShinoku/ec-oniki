class Admin::OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  include OrdersHelper

  def index
    params[:prev_path].nil? ? @prev_path = Rails.application.routes.recognize_path(request.referer) : @prev_path = params[:prev_path].permit!
    if params[:is_from_header].to_i == 1
      @orders = Order.all.order(created_at: "DESC")
    elsif
      if @prev_path[:controller] == "admin/homes"
        @orders = Order.where(created_at: Time.zone.today.all_day).order(created_at: "DESC")
      elsif @prev_path[:controller] == "admin/users"
        @user_id = params[:user_id]
        @orders = Order.where(user_id: params[:member_id]).order(created_at: "DESC")
      end
    else
      @orders = Order.all.order(created_at: "DESC")
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end
  
  def order_update
    @order = Order.find(params[:id])
    if  @order.update( params_int(order_params) )
      @order.auto_update_work_status
      flash[:success] = "注文ステータスの更新が完了しました"
      redirect_to admin_order_path(@order)
    else
      @order_products = @order.order_products
      flash.now[:danger] = "注文ステータスの更新に失敗しました"
      render action: :show
    end
  end

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = Order.find(@order_product.order.id)
    if @order_product.update( params_int(order_product_params) )
      @order_product.auto_update_order_status
      flash[:success] = "商品別ステータスの更新が完了しました"
      redirect_to admin_order_path(@order)
    else
      @order_products = @order.order_products
      flash.now[:danger] = "商品別ステータスの更新に失敗しました"
      render action: :show
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:status)
  end

  def order_product_params
    params.require(:order_product).permit(:work_status)
  end

  #数値に変換可能なparamsをintegerに変換してくれる
  def params_int(model_params)
    model_params.each do |key, value|
      if integer_string?(value)
        model_params[key]=value.to_i
      end
    end
  end

end
