class Lab::TopController < ApplicationController
  before_action :check_lab_admin
  def index
  end
end
