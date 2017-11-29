class Admin::DivisionsController < ApplicationController
  layout 'admin'
  before_action :set_division, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /divisions
  # GET /divisions.json
  def index
    @divisions = Admin::Division.paginate(page: params[:page], per_page: 20).joins(:game).includes(:game).order('games.date DESC')
  end

  # GET /divisions/1
  # GET /divisions/1.json
  def show
  end

  # GET /divisions/new
  def new
    @division = Admin::Division.new
    @games = Admin::Game.none
    @distances = []
  end

  # GET /divisions/1/edit
  def edit
    @games = Admin::Game.where(year: @division.game.year)
  end

  # POST /divisions
  # POST /divisions.json
  def create
    @division = Admin::Division.new(division_params)
    if @division.save
      redirect_to @division, notice: "#{t('notice.created',{ model: "#{t('activerecord.models.admin/division')}" })}"
    else
      if params[:year]
        @games = Admin::Game.where(year: params[:year]).order(date: :asc)
      else
        @games = Admin::Game.none
      end
      render :new
    end
  end

  # PATCH/PUT /divisions/1
  # PATCH/PUT /divisions/1.json
  def update
    if @division.update(division_params)
      redirect_to @division, notice: "#{t('notice.updated',{ model: "#{t('activerecord.models.admin/division')}" })}"
    else
      render :edit
    end
  end

  # DELETE /divisions/1
  # DELETE /divisions/1.json
  def destroy
    unless @division.results.empty?
      redirect_to admin_divisions_url, notice: "#{t('notice.delete_canceled',{ model: "#{t('activerecord.models.admin/division')}", relation: "#{t('activerecord.models.admin/result')}" })}"
    else
      @division.destroy
      redirect_to admin_divisions_url, notice: "#{t('notice.deleted',{ model: "#{t('activerecord.models.admin/division')}" })}"
    end
  end

  def ajax
    if params[:year]
      @ajax = 'game'
      @games = Admin::Game.where(year: params[:year]).order(date: :asc)
      respond_to do |format|
        format.js
      end
    elsif params[:game]
      @ajax = 'distance'
      @distance = Admin::Game.find(params[:game]).game_type
      respond_to do |format|
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_division
      @division = Admin::Division.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def division_params
      params.require(:admin_division).permit(:game_id, :div, :distance, :finisher, :team_rank, :num_of_team)
    end
end
