class Admin::ReleasedInfosController < ApplicationController
  layout 'admin'
  before_action :set_released_info, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /released_infos
  # GET /released_infos.json
  def index
    @released_infos = Admin::ReleasedInfo.order(date: :desc).paginate(page: params[:page], per_page: 20)
  end

  # GET /released_infos/1
  # GET /released_infos/1.json
  def show
  end

  # GET /released_infos/new
  def new
    @released_info = Admin::ReleasedInfo.new
  end

  # GET /released_infos/1/edit
  def edit
  end

  # POST /released_infos
  # POST /released_infos.json
  def create
    @released_info = Admin::ReleasedInfo.new(released_info_params)

    if @released_info.save
      redirect_to @released_info, notice: "#{t('notice.created', model: "#{t('activerecord.models.admin/released_info')}")}"
    else
      render :new
    end
  end

  # PATCH/PUT /released_infos/1
  # PATCH/PUT /released_infos/1.json
  def update
    if @released_info.update(released_info_params)
      redirect_to @released_info, notice: "#{t('notice.updated', model: "#{t('activerecord.models.admin/released_info')}")}"
    else
      render :edit
    end
  end

  # DELETE /released_infos/1
  # DELETE /released_infos/1.json
  def destroy
    @released_info.destroy
    redirect_to admin_released_infos_url, notice: "#{t('notice.deleted', model: "#{t('activerecord.models.admin/released_info')}")}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_released_info
      @released_info = Admin::ReleasedInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def released_info_params
      params.require(:admin_released_info).permit(:date, :body)
    end
end
