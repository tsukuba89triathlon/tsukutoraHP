class AccountsController < ApplicationController
  before_action :check_logined, except: [:login]

  def show
    @member = Member.find(session[:member_id])
  end

  def login
  end

  def logout
    reset_session
    redirect_to '/'
  end

end
