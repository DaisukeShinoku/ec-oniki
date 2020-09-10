class HomesController < ApplicationController
  def top
    @categories = Category.where(is_valid: true)
    @areas = Area.all
  end
  
end
