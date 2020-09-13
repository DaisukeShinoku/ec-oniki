class HomesController < ApplicationController
  
  def top
    @categories = Category.where(is_valid: true)
    @areas = Area.all
    @products = Product.all
    @gourmet = Product.where(category_id: 1)
  end
  
end
