class Admin::ResultsController < ApplicationController
  layout 'admin'
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /results
  # GET /results.json
  def index
    @results = Admin::Result.index.paginate(page: params[:page], per_page: 20)
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Admin::Result.new
    @games = Admin::Game.none
    @divisions = Admin::Division.none
  end

  # GET /results/1/edit
  def edit
    @games = Admin::Game.where(year: @result.game.year)
    @divisions = Admin::Division.where(game_id: @result.game.id)
  end
  # POST /results
  # POST /results.json
  def create
    @result = Admin::Result.new(result_params)
    if @result.save && @result.result_check
      redirect_to @result, notice: t('notice.created',{model: "#{t('activerecord.models.admin/result')}"})
    else
      @games = Admin::Game.none
      @divisions = Admin::Division.none
      render :new
      return
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    if @result.update(result_params) && @result.result_check
      redirect_to @result, notice: t('notice.updated',{model: "#{t('activerecord.models.admin/result')}"})
    else
      @games = Admin::Game.where(year: @result.game.year)
      @divisions = Admin::Division.where(game_id: @result.game.id)
      @count = 'おはよう'
      render :edit
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    redirect_to admin_results_url, notice: t('notice.deleted',{model: "#{t('activerecord.models.admin/result')}"})
  end

  def year
    year = params[:year].to_i
    @games = Admin::Game.where(year: year).order(date: :asc)
    @results = Admin::Result.year(year)
  end

  def ajax
    if params[:year]
      @games = Admin::Game.where(year: params[:year]).order(date: :asc)
      @divisions = @games.first.divisions
      @results = Admin::Result.new
      @ajax = 'game'
    elsif params[:game_id]
      @game = Admin::Game.find(params[:game_id].to_i)
      @games = Admin::Game.where(year: @game.year)
      @divisions = @game.divisions
      @results = Admin::Result.new
      @ajax = 'div'
    elsif params[:state]
      @state = params[:state].to_i
      @ajax = 'state'
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Admin::Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params[:admin_result][:date] = (params[:admin_result][:game_id] != "" ? Admin::Game.find(params[:admin_result][:game_id]).date : nil)
      params.require(:admin_result).permit(:game_id, :division_id, :member_id, :date, :division, :total_rank, :state, :total_time, :s_time, :s_rank, :b_time, :b_rank, :split, :split_rank, :r_time, :r_rank, :remarks, :total_check, :s_check, :b_check, :split_check, :r_check)
    end
end
