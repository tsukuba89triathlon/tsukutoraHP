class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class Forbidden < StandardError; end
  class NotFound < StandardError; end

  if Rails.env.production?
    rescue_from Exception, with: :rescue_500
    rescue_from ActionController::RoutingError, with: :rescue_404
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
    rescue_from ActionController::ParameterMissing, with: :rescue_400
  end

  rescue_from Forbidden, with: :rescue_403
  rescue_from NotFound, with: :rescue_404

  private

  def rescue_400
    render "errors/bad_request", status: 400, formats: [:html]
  end

  def rescue_403(exception)
    render "errors/forbidden", status: 403, formats: [:html]
  end

  def rescue_404(exception)
    render "errors/not_found", status: 404, formats: [:html]
  end

  def rescue_500(exception)
    render "errors/internal_server_error", layout: "error", formats: [:html]
  end

  def check_logined
    if session[:member_id] then
    else
      flash[:referer] = request.fullpath
      render "accounts/login"
    end
  end

  def check_self(id)
    if session[:member_id]
      if session[:member_id] == id
      else
        render "errors/forbidden", status: 403, formats: [:html]
      end
    else
      flash[:referer] = request.fullpath
      render "accounts/login"
    end
  end

  def check_lab_admin
    if session[:member_id]
      if Member.find(session[:member_id]).lab_admin == true
      else
        render "errors/forbidden", status: 403, formats: [:html]
      end
    else
      flash[:referer] = request.fullpath
      render "accounts/login"
    end
  end

  def check_admin
    if session[:member_id]
      if Member.find(session[:member_id]).administration == true
      else
        render "errors/forbidden", status: 403, formats: [:html], layout: 'application'
      end
    else
      flash[:referer] = request.fullpath
      render "accounts/login"
    end
  end

end
