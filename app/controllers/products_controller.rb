class ProductsController < ApplicationController

  def index
    @products = SearchProductsForm.new(params).result
    @categories = Category.where(is_valid: true)
    @areas = Area.all
    
    if params[:area_id]
      @message = "「#{Area.find(params[:area_id]).name}」の商品一覧"
    elsif params[:category_id]
      @message = "「#{Category.find(params[:category_id]).name}」の商品一覧"
    else
      @message = "商品一覧"
    end
    
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
    @areas = Area.all
    @cart_product = CartProduct.new
  end
  
end
