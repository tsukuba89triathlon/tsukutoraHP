class Admin::TopicsController < ApplicationController
  layout 'admin'
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /topics
  # GET /topics.json
  def index
    @topics = Admin::Topic.order(date: :desc).paginate(page: params[:page], per_page: 20)
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = Admin::Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Admin::Topic.new(topic_params)
    file = params[:admin_topic][:image] # ファイルを取得
    unless file == nil
      name = file.original_filename #ファイルのベース名
      permits = ['.jpeg','.jpg','.gif','png']
      if !permits.include?(File.extname(name).downcase)
        @topic.errors.add(:image, "#{t('invaild_image')}")
        render :new
      elsif file.size > 10.megabyte
        @topic.errors.add(:image, "#{t('too_big_image')}")
        render :new
      else
        name = "#{@topic.date}#{File.extname(name).downcase}"
        File.open("public/img/topics/#{name}", 'wb') { |f| f.write(file.read) }
        @image.path = "img/topics/#{name}"
        @image.save
        redirect_to admin_images_path, notice: "#{t('notice.created',{model: "#{t('activerecord.models.admin/topic')}"})}"
      end
    else
      if @topic.save
        redirect_to @topic, notice: "#{t('notice.created',{model: "#{t('activerecord.models.admin/topic')}"})}"
      else
        render :new
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    if params[:admin_topic][:image] != nil
      file = params[:admin_topic][:image] # ファイルを取得
      name = file.original_filename #ファイルのベース名
      permits = ['.jpeg','.jpg','.gif','png']
      if !permits.include?(File.extname(name).downcase)
        @topic.errors.add(:image, 'の拡張子が正しくありません。')
        render :edit
      elsif file.size > 10.megabyte
        @topic.errors.add(:image, 'のサイズが大きすぎます。10MBまでです。')
        render :edit
      else
        name = "#{@topic.date}#{File.extname(name).downcase}"
        File.open("public/img/topics/#{name}", 'wb') { |f| f.write(file.read) }
        @topic.path = "img/topics/#{name}"
      end
    end
    if @topic.update(topic_params)
      redirect_to admin_topics_path, notice: "#{t('notice.updated',{model: "#{t('activerecord.models.admin/topic')}"})}"
    else
      render :edit
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    redirect_to admin_topics_url, notice: "#{t('notice.deleted',{model: "#{t('activerecord.models.admin/topic')}"})}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Admin::Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:admin_topic).permit(:title, :date, :game_id, :body, :path)
    end
end
