class OrdersController < ApplicationController
  before_action :logged_in_user

  include OrdersHelper

  def new
    @order = Order.new
  end

  def create
    binding.pry
    @order = Order.new(params_int(order_params))
    if @order.save
      
      @cart_products = CartProduct.where(user_id: current_user.id)

      binding.pry

      @cart_products.each do |cart_product|
        @order_products = OrderProduct.create(
          product_id: cart_product.product.id,
          order_id: @order.id,
          price: cart_product.product.price,
          quantity: cart_product.quantity
          )
      end

      @cart_products.destroy_all

      case params[:order][:radio_number].to_i
        when 1
        when 2
        when 3
          @destination = Destination.create(
            user_id: current_user.id,
            receiver: params[:order][:receiver],
            postcode: params[:order][:postcode],
            prefecture_code: params[:order][:prefecture_code],
            address_city: params[:order][:address_city],
            address_street: params[:order][:address_street],
            address_building: params[:order][:address_building],
            )
      end
      redirect_to thanks_orders_url
    else
      flash.now[:danger] = '購入に失敗しました'
      @cart_products = CartProduct.where(user_id: current_user.id)
      @postage = 800
      render :confirm
    end
  end
  
  def confirm
    
    
    binding.pry
    
    
    @cart_products = CartProduct.where(user_id: current_user.id)
    @postage = 800

    if params[:order][:payment_option].nil?
      params[:order][:payment_option] =
      case params[:order][:radio_number].to_i
      when 1
        destination_when1
      when 2
        destination_when2
      when 3
        destination_when3
      when 0
        destination_when0
      end
      # @order.valid?
      flash.now[:danger] = '支払い方法が選択されていません'
      render action: :new
    else
      case params[:order][:radio_number].to_i
      when 1
        destination_when1
        @order.payment_option = params[:order][:payment_option].to_i
        @order.radio_number = params[:order][:radio_number].to_i
      when 2
        destination_when2
        @order.payment_option = params[:order][:payment_option].to_i
        @order.radio_number = params[:order][:radio_number].to_i
      when 3
        destination_when3
        @order.payment_option = params[:order][:payment_option].to_i
        @order.radio_number = params[:order][:radio_number].to_i
      when 0
        destination_when0
      end

      if params[:order][:radio_number].nil?
        flash.now[:danger] = '配送先が選択されていません'
        render action: :new
      end
    end
  end

  def thanks
    
  end

  def index
    @orders = Order.where(user_id: current_user.id).order(created_at: "DESC").all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  private
  
  def destination_when1
    ##自分の住所
    @order = Order.new(
    user_id: current_user.id,
    receiver: current_user.fullname,
    postcode: current_user.postcode,
    prefecture_code: current_user.prefecture_code,
    address_city: current_user.address_city,
    address_street: current_user.address_street,
    address_building: current_user.address_building,
    billing: @cart_products.map{ |cp| (cp.product.price_tax*cp.quantity) }.sum.round + @postage
    )
  end

  def destination_when2
    ##登録された住所から選択
    destination = Destination.find(params[:order][:destination_id])
    @order = Order.new(
      user_id: current_user.id,
      receiver: destination.receiver,
      postcode: destination.postcode,
      prefecture_code: destination.prefecture_code,
      address_city: destination.address_city,
      address_street: destination.address_street,
      address_building: destination.address_building,
      billing: @cart_products.map{ |cp| (cp.product.price_tax*cp.quantity) }.sum.round + @postage
    )
  end

  def destination_when3
    ##新規作成の住所
    @order = Order.new(
      user_id: current_user.id,
      receiver: params[:order][:receiver],
      postcode: params[:order][:postcode],
      prefecture_code: params[:order][:prefecture_code],
      address_city: params[:order][:address_city],
      address_street: params[:order][:address_street],
      address_building: params[:order][:address_building],
      billing: @cart_products.map{ |cp| (cp.product.price_tax*cp.quantity) }.sum.round + @postage
      )
  end

  def destination_when0
    @order = Order.new(
      user_id: current_user.id,
      billing: @cart_products.map{ |cp| (cp.product.price_tax*cp.quantity) }.sum.round + @postage
      )
  end

  def order_params
    params.require(:order).permit(:user_id, :receiver,
       :postcode, :prefecture_code, :address_city, :address_street, :address_building,
        :payment_option, :status, :postage, :billing, :destination_id, :radio_number)
  end
  
  #数値に変換可能なparamsをintegerに変換してくれる(helperに変更可能か確認するメソッドを定義)
  def params_int(model_params)
    model_params.each do |key, value|
      if integer_string?(value)
        model_params[key]=value.to_i
      end
    end
  end
end
