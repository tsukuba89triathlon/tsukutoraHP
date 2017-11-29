class Admin::GamesController < ApplicationController
  layout 'admin'
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /games
  # GET /games.json
  def index
    @games = Admin::Game.all.order("date DESC").paginate(page: params[:page], per_page: 20)
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Admin::Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Admin::Game.new(game_params)
    if @game.save
      redirect_to @game, notice: t('notice.created',{model: "#{t('activerecord.models.admin/game')}"})
    else
      render :new
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    if @game.update(game_params)
      redirect_to @game, notice: t('notice.updated',{model: "#{t('activerecord.models.admin/game')}"})
    else
      render :edit
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    unless @game.divisions.empty?
      redirect_to admin_games_url,
      notice: t('notice.delete_canceled',{model: "#{t('activerecord.models.admin/game')}", relation: "#{t('activerecord.models.admin/division')}"})
    else
      @game.destroy
      redirect_to admin_games_url, notice: t('notice.deleted',{model: "#{t('activerecord.models.admin/game')}"})
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Admin::Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params[:admin_game][:year] = params[:admin_game]["date(2i)"].to_i > 3 ? params[:admin_game]["date(1i)"] : "#{params[:admin_game]["date(1i)"].to_i - 1}"
      params.require(:admin_game).permit(:game, :year, :game_anchor, :date, :game_type)
    end
end
