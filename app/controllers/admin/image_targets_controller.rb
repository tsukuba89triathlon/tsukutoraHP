class Admin::ImageTargetsController < ApplicationController
  layout 'admin'
  before_action :set_image_target, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /image_targets
  # GET /image_targets.json
  def index
    @image_targets = Admin::ImageTarget.recent_year(4).order(target: :asc)
  end

  def index_all
    @image_targets = Admin::ImageTarget.order(target: :asc)
    render :index
  end

  # GET /image_targets/1
  # GET /image_targets/1.json
  def show
  end

  # GET /image_targets/new
  def new
    @image_target = Admin::ImageTarget.new
  end

  # GET /image_targets/1/edit
  def edit
  end

  # POST /image_targets
  # POST /image_targets.json
  def create
    @image_target = Admin::ImageTarget.new(image_target_params)

    if @image_target.save
      redirect_to @image_target, notice: "#{t('notice.created',{model: "#{t('activerecord.models.admin/image_target')}"})}"
    else
      render :new
    end
  end

  # PATCH/PUT /image_targets/1
  # PATCH/PUT /image_targets/1.json
  def update
    if @image_target.update(image_target_params)
      redirect_to @image_target, notice: "#{t('notice.updated',{model: "#{t('activerecord.models.admin/image_target')}"})}"
    else
      render :edit
    end
  end

  # DELETE /image_targets/1
  # DELETE /image_targets/1.json
  def destroy
    if @image_target.images.empty?
      @image_target.destroy
      redirect_to admin_image_targets_url, notice: "#{t('notice.deleted',{model: "#{t('activerecord.models.admin/image_target')}"})}"
    else
      redirect_to admin_image_targets_url, notice: "#{t('notice.delete_canceled', {model: "#{t('activerecord.models.admin/image_target')}", relation: "#{t('activerecord.models.admin/image')}"})}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_target
      @image_target = Admin::ImageTarget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_target_params
      params.require(:admin_image_target).permit(:target, :path)
    end
end
