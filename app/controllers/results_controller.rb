class ResultsController < ApplicationController
  before_action :set_result, only: [:show]
  before_action :check_logined, only: [:my_results]

  # GET /results
  # GET /results.json
  def index
    @image_targets = {}
    @games = Game.all
    0.upto(3) do |idx|
      @image_targets[idx] = Admin::ImageTarget.r_year(Date.today.months_ago(3).years_ago(idx).year).first
    end
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  def year
    year = params[:year].to_i
    @games = Game.year(year).includes(:divisions)
  end

  def archives
    @games = Game.all.order(year: :desc)
  end

  def my_results
    respond_to do |format|
      format.html { @games = Game.joins(:results).where('results.member_id = ?',session[:member_id]).order(date: :desc).includes(:divisions, :results) }
      format.csv {
        @results = []
        1.upto(4) do |idx|
          @results[idx] = Result.joins(:game).where('member_id = ? AND games.game_type = ?',session[:member_id],idx).order('games.date ASC')
        end
        render 'my_results.csv'
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params[:result][:date] = Game.find(params[:result][:game_id]).date
      params.require(:result).permit(:game_id, :division_id, :member_id, :date, :division, :total_rank, :total_time, :s_time, :s_rank, :b_time, :b_rank, :split, :split_rank, :r_time, :r_rank, :remarks)
    end
end
