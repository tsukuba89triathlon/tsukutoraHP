class Admin::SchoolsController < ApplicationController
  layout 'admin'
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /schools
  # GET /schools.json
  def index
    @schools = Admin::School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = Admin::School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = Admin::School.new(school_params)

    if @school.save
      redirect_to @school, notice: t('notice.created',{model: "#{t('activerecord.models.admin/school')}"})
    else
      render :new
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    if @school.update(school_params)
      redirect_to @school, notice: t('notice.updated',{model: "#{t('activerecord.models.admin/school')}"})
    else
      render :edit
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    unless @school.colleges.empty?
      redirect_to admin_schools_url, notice: t('notice.delete_canceled',{model: "#{t('activerecord.models.admin/school')}", relation: "#{t('activerecord.models.admin/college')}"})
    else
      @school.destroy
      redirect_to admin_schools_url, notice: t('notice.deleted',{model: "#{t('activerecord.models.admin/school')}"})
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = Admin::School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:admin_school).permit(:school)
    end
end
