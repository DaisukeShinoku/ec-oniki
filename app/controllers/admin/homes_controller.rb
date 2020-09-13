class Admin::HomesController < ApplicationController
  def top
    @categories = Category.all
    @areas = Area.all
  end
end
