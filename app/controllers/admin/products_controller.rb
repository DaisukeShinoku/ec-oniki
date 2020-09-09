class Admin::ProductsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      flash[:success] = '商品を登録しました'
      redirect_to admin_product_path(@product)
    else
      flash.now[:danger] = '商品の登録に失敗しました'
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    if @product.update(products_params)
      flash[:success] = '商品を更新しました'
      redirect_to admin_product_path(@product)
    else
      flash.now[:danger] = '商品の更新に失敗しました'
      render 'edit'
    end
  end

  private

  def products_params
    params.require(:product).permit(:category_id, :area_id, :name, :introduction, :price, :is_valid, :image)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

end
