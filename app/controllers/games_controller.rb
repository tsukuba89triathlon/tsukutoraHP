class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all.order("date DESC")
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

end
