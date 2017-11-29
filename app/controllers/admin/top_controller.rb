class Admin::TopController < ApplicationController
  layout 'admin'
  before_action :check_admin
  def index
  end
end
