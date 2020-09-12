class CartProductsController < ApplicationController
  before_action :logged_in_user

  def index
    @cart_products = CartProduct.where(user_id: current_user.id)
    @categories = Category.where(is_valid: true)
    @areas = Area.all
  end

  def update
    @cart_products = CartProduct.find(params[:id])
    if @cart_products.update(cart_product_params)
      flash[:info] = '個数を変更しました'
      redirect_to cart_products_url
    else
      flash.now[:info] = '個数の変更に失敗しました'
      render :index
    end
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.user_id = current_user.id
    if @cart_product.save
      flash[:info] = '商品をカートに追加しました'
      redirect_to cart_products_url
    else
      flash[:info] = '個数を変更してください'
      redirect_to request.referer
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    flash[:info] = '商品の削除が完了しました'
    redirect_to cart_products_url
  end

  def destroy_all
    user = User.find(current_user.id)
    if user.cart_products.destroy_all
      flash[:info] = 'カート内の商品を全て削除しました'
      redirect_to cart_products_url
    else
      flash.now[:info] = 'カート内の商品を削除できませんでした'
      render :index
    end
  end
  
  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :price, :user_id, :product_id)
  end
  
end
