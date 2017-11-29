class SessionsController < ApplicationController
  def create
    member = Member.find_by(user_name: params[:username])
    if member == nil
      flash.alert = "ユーザーが存在しません。"
    else
      member = member.authenticate(params[:password])
      if member
        session[:member_id] = member.id
      else
        flash.alert = "名前とパスワードが一致しません。"
      end
    end
    redirect_to flash[:referer]
  end

  def destroy
    session.delete(:member_id)
    redirect_to :root
  end
end
