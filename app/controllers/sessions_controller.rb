class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = 'ログインしました!!'
      if user.is_valid == false
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
end
