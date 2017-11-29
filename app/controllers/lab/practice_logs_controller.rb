class Lab::PracticeLogsController < ApplicationController
  require 'kconv'
  before_action :set_lab_practice_log, only: [:show, :edit, :update, :destroy]
  before_action :check_logined, only: [:index, :new, :create, :download]
  before_action -> { check_self(Lab::PracticeLog.find(params[:id]).member_id ) }, only: [:edit, :update, :destroy]

  # GET /lab/practice_logs
  # GET /lab/practice_logs.json
  def index
    @logs = Lab::PracticeLog.where(member_id: session[:member_id]).order(date: :desc).paginate(page: params[:page], per_page: 20)
  end

  # GET /lab/practice_logs/1
  # GET /lab/practice_logs/1.json
  def show
  end

  # GET /lab/practice_logs/new
  def new
    @lab_practice_log = Lab::PracticeLog.new
    @member = Member.find(session[:member_id])
  end

  # GET /lab/practice_logs/1/edit
  def edit
    @member = Member.find(session[:member_id])
  end

  # POST /lab/practice_logs
  # POST /lab/practice_logs.json
  def create
    @lab_practice_log = Lab::PracticeLog.new(lab_practice_log_params)

    if @lab_practice_log.save
      redirect_to @lab_practice_log, notice: t('notice.created',{model: t('activerecord.models.lab/practice_log')})
    else
      render :new
    end
  end

  # PATCH/PUT /lab/practice_logs/1
  # PATCH/PUT /lab/practice_logs/1.json
  def update
    if @lab_practice_log.update(lab_practice_log_params)
      redirect_to @lab_practice_log, notice: t('notice.updated',{model: t('activerecord.models.lab/practice_log')})
    else
      render :edit
    end
  end

  # DELETE /lab/practice_logs/1
  # DELETE /lab/practice_logs/1.json
  def destroy
    @lab_practice_log.destroy
    redirect_to lab_practice_logs_url, notice: t('notice.deleted',{model: t('activerecord.models.lab/practice_log')})
  end

  def rank
    @monthly_logs = Lab::PracticeLog.monthly_sum(Date.today).includes(:member)
    @annual_logs = Lab::PracticeLog.annual_sum(Date.today).includes(:member)
  end

  def monthly_rank
    @logs = []
    month = Date.today.end_of_month
    Lab::PracticeLog.where('date < ? AND date >= ?',Date.today,Date.today.months_ago(23)).order(date: :desc).each do |log|
      if log.date < month
        @logs << [month.strftime('%Y年 %m月'),Lab::PracticeLog.monthly_sum(log.date)]
        month = log.date.months_ago(1).end_of_month
      end
    end
  end

  def annual_rank
    @logs = []
    year = Date.today.months_ago(3).end_of_year.months_since(3)
    Lab::PracticeLog.order(date: :desc).each do |log|
      if log.date < year
        @logs << [year.months_ago(3).strftime('%Y年度'),Lab::PracticeLog.annual_sum(log.date)]
        year = log.date.months_ago(3).end_of_year.months_since(3).years_ago(1)
      end
    end
  end

  def member
    if params[:date]
      @date = Date.parse(params[:date])
    else
      @date = Date.today
    end
    @logs = Lab::PracticeLog.where(member_id: params[:member_id]).order(date: :desc)
  end

  def download
    @logs = Lab::PracticeLog.where(member_id: session[:member_id]).order(date: :desc)
    render 'download.csv'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_practice_log
      @lab_practice_log = Lab::PracticeLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_practice_log_params
      swim = params[:lab_practice_log][:swim].to_f
      bike = params[:lab_practice_log][:bike].to_f
      run = params[:lab_practice_log][:run].to_f
      params[:lab_practice_log][:conversion_distance] = calculate(swim,bike,run)
      params.require(:lab_practice_log).permit(:member_id, :date, :swim, :bike, :run, :conversion_distance, :remark, :public)
    end

    def calculate(swim,bike,run)
      swim * 2 + bike * 0.4 + run
    end
end
