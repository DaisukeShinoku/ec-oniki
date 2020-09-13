class Admin::HomesController < ApplicationController
  def top
    @categories = Category.all
    @areas = Area.all
    @orders = Order.where(created_at: Time.zone.now.all_day)
  end
end
