class Admin::CollegesController < ApplicationController
  layout 'admin'
  before_action :set_college, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /colleges
  # GET /colleges.json
  def index
    @colleges = Admin::College.includes(:school).order(school_id: :asc)
  end

  # GET /colleges/1
  # GET /colleges/1.json
  def show
  end

  # GET /colleges/new
  def new
    @college = Admin::College.new
  end

  # GET /colleges/1/edit
  def edit
  end

  # POST /colleges
  # POST /colleges.json
  def create
    @college = Admin::College.new(college_params)

    if @college.save
      redirect_to @college, notice: t('notice.created',{model: t('activerecord.models.admin/college')})
    else
      render :new
    end
  end

  # PATCH/PUT /colleges/1
  # PATCH/PUT /colleges/1.json
  def update
    if @college.update(college_params)
      redirect_to @college, notice: t('notice.updated',{model: t('activerecord.models.admin/college')})
    else
      render :edit
    end
  end

  # DELETE /colleges/1
  # DELETE /colleges/1.json
  def destroy
    unless @college.members.empty?
      redirect_to admin_colleges_url, notice: t('notice.delete_canceled',{model: t('activerecord.models.admin/college'), relation: t('activerecord.models.admin/member')})
    else
      @college.destroy
      redirect_to admin_colleges_url, notice: t('notice.deleted',{model: t('activerecord.models.admin/college')})
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = Admin::College.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.require(:admin_college).permit(:school_id, :college, :abbreviation)
    end
end
