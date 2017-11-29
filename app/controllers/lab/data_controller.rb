class Lab::DataController < ApplicationController
  def index
    @data = Lab::Datum.none
  end
  def seminar

  end
end
