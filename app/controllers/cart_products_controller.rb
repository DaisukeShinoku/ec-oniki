class CartProductsController < ApplicationController
  before_action :logged_in_user

  def index
    @cart_products = CartProduct.where(user_id: current_user.id)
  end

  def update
    @cart_products = CartProduct.find(params[:id])
    if @cart_products.update(cart_product_params)
      redirect_to cart_products_path, notice: '個数を変更しました'
    end
    render :index, notice: '個数の変更に失敗しました'
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.user_id = current_user.id
    if @cart_product.save
      redirect_to cart_products_path, notice: '商品をカートに追加しました'
    else
      redirect_to request.referer, notice: '個数を選択しました'
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path, notice: '商品の削除が完了しました'
  end

  def destroy_all
    user = User.find(current_user.id)
    if user.cart_products.destroy_all
      redirect_to cart_products_path, notice: 'カート内の商品を全て削除しました'
    else
      render :index, notice: "カート内の商品を削除できませんでした。"
    end
  end
  
  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :price, :user_id, :product_id)
  end
  
end
