class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = 'ログインしました!!'
      if user.admin == false
        redirect_to user
      else
        redirect_to admin_top_url
      end
    else
      flash.now[:danger] = 'メールアドレスかパスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:info] = 'ログアウトしました!!'
    redirect_to root_url
  end

  def user_guest
    user = User.find_by(email: "users7@user.com")
    log_in user
    flash[:info] = 'ゲストユーザーとしてログインしました'
    redirect_to user
  end

  def admin_guest
    user = User.find_by(email: "users8@user.com")
    log_in user
    flash[:info] = 'ゲストユーザー(管理者)としてログインしました'
    redirect_to admin_top_url
  end
  
end
