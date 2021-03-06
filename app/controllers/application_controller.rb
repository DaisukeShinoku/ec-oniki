class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def not_normal_user
    redirect_to(admin_top_url) if current_user.admin?
  end

    # ゲストユーザーかどうか確認
    def check_guest
      if current_user.guest?
      flash[:danger] = "ゲストユーザーには許可されていないアクションです"
      redirect_to root_url
      end
    end
  
end
