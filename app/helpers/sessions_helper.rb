module SessionsHelper

  def log_in(user)                                                  # 引数(ユーザ)でログイン
    session[:user_id] = user.id
  end


  def current_user                                                  # ログインユーザを返す
    @current_user ||= User.find_by(id:session[:user_id])
  end


  def logged_in?                                                    # ログイン中？
    !current_user.nil?                                              # current_userメソッド利用
  end


  def log_out                                                       # ログアウト
    session.delete(:user_id)
    @current_user = nil
  end
end