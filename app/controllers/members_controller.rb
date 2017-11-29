class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action -> { check_self(params[:id].to_i) }, only: [:edit, :update]
  before_action :check_logined, only: [:pass_edit, :pass_update]

  # GET /members
  # GET /members.json
  def index
    @image_targets = {}
    @members = Member.active
    0.upto(4) do |idx|
      @image_targets[idx] = Admin::ImageTarget.g_year(Date.today.months_ago(3).years_ago(idx).year).first
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  def edit
  end

  def pass_edit
    @member = Member.find(session[:member_id])
  end

  def pass_update
    @member = Member.find(session[:member_id])
    if @member.update(password_params)
      redirect_to account_path, notice: t('notice.updated',{model: t('activerecord.models.member')})
    else
      render 'pass_edit'
    end
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to @member, notice: t('notice.created',{model: t('activerecord.models.member')})
    else
      render :new
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    if @member.update(member_params)
      redirect_to @member, notice: t('notice.updated',{model: t('activerecord.models.member')})
    else
      render :edit
    end
  end

  def b1
    @members = Member.active.grade(1).order(full_name: :desc)
    render 'active'
  end

  def b2
    @members = Member.active.grade(2).order(full_name: :desc)
    render 'active'
  end

  def b3
    @members = Member.active.grade(3).order(full_name: :desc)
    render 'active'
  end

  def b4
    @members = Member.active.grade(4).order(full_name: :desc)
    render 'active'
  end

  def master
    @members = Member.active.grade([11,12,21,22,23]).order(grade: :asc)
    render 'active'
  end

  def obog
    @members = Member.where(status: 3) #OBOGの人たちを卒業年順にソートして並べる
    render 'obog'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:user_name, :password, :password_confirmation, :hometown, :school, :sports, :bike, :q1, :a1, :q2, :a2, :q3, :a3, :q4, :a4, :q5, :a5, :part, :goal, :last)
    end

    def password_params
      params.require(:member).permit(:password, :password_confirmation)
    end
end
