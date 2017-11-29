class Admin::MembersController < ApplicationController
  layout 'admin'
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /members
  # GET /members.json
  def index
    @active = Admin::Member.active
  end

  def obog
    @obog = Admin::Member.obog.paginate(page: params[:page], per_page: 20)
    render :index
  end

  def left
    @left = Admin::Member.left.paginate(page: params[:page], per_page: 20)
    render :index
  end
  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Admin::Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Admin::Member.new(member_params)

    if @member.save
      redirect_to @member, notice: t('notice.created',{model: t('activerecord.models.admin/member')})
    else
      render :new
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    if @member.update(member_params)
      redirect_to @member, notice: t('notice.updated',{model: t('activerecord.models.admin/member')})
    else
      render :edit
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    unless @member.results.empty?
      redirect_to admin_members_path, notice: t('notice.delete_canceled',{model: t('activerecord.models.admin/member'),relation: t('activerecord.models.admin/result')})
    else
      @member.destroy
      redirect_to admin_members_path, notice: t('notice.deleted',{model: t('activerecord.models.admin/member')})
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Admin::Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      school_name = "#{Admin::College.find(params[:admin_member][:college_id].to_i).school.school}"
      college_name = "#{Admin::College.find(params[:admin_member][:college_id].to_i).college}"
      unless [24, 25].include?(params[:admin_member][:college_id].to_i)
        params[:admin_member][:belong] = school_name + " " + college_name
      else
        params[:admin_member][:belong] = school_name # 体専・芸専の場合は学類名のみ
      end
      params.require(:admin_member).permit(:full_name, :user_name, :yomigana, :password, :status, :grade, :college_id, :belong, :administration, :lab_admin)
    end
end
