class OrdersController < ApplicationController
  before_action :logged_in_user

  def new
    @order = Order.new
  end

  def create
    if @order = Order.create(params_int(order_params))

      @cart_products = CartProduct.where(user_id: current_user.id)
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
            postcode: params[:order][:postal_code],
            address: params[:order][:address]
            )
      end
      redirect_to thanks_order_url
    else
      render :confirm, notice: '購入に失敗しました'
    end
  end
  
  def confirm
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
      @order.valid?
      render action: :new, notice: '支払い方法が選択されていません'
    else
      case params[:order][:radio_number].to_i
      when 1
        destination_when1
        @order.payment_option = params[:order][:payment_option].to_i
      when 2
        destination_when2
        @order.payment_option = params[:order][:payment_option].to_i
      when 3
        destination_when3
        @order.payment_option = params[:order][:payment_option].to_i
      when 0
        destination_when0
      end

      if @order.valid?
      else
        render action: :new, notice: '配送先が選択されていません'
      end
    end
  end

  def thanks
    
  end

  def index
    @orders = Order.where(member_id: current_member.id).order(created_at: "DESC").all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  private
  
  def order_params
    params.require(:order).permit(:user_id, :receiver,
       :postcode, :prefecture_code, :address_city, :address_street, :address_building,
        :payment_option, :status, :postage, :billing)
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
