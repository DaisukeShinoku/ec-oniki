class Admin::HomesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def top
    @categories = Category.all
    @areas = Area.all
    @orders = Order.where(created_at: Time.zone.now.all_day)
  end
end
