class ImagesController < ApplicationController
  before_action :check_logined
  before_action :set_image, only: [:edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.member_images(session[:member_id])
  end

  # GET /images/new
  def new
    @image = Image.new
    @image_url = account_images_path
  end

  # GET /images/1/edit
  def edit
    @image_url = account_image_path(@image)
  end

  # POST /images
  # POST /images.json
  def create
    params[:image][:member_id] = session[:member_id]
    params[:image][:effective] = true
    @image = Image.new(image_params)
    file = params[:image][:image]
    if file # ファイルを取得
      name = file.original_filename #ファイルのベース名
      permits = ['.jpeg','.jpg','.gif','png']
      if !permits.include?(File.extname(name).downcase)
        @image.errors.add(:image, 'の拡張子が正しくありません。')
        @image_url = account_images_path
        render :new
      elsif file.size > 10.megabyte
        @image.errors.add(:image, 'のサイズが大きすぎます。10MBまでです。')
        @image_url = account_images_path
        render :new
      else
        name = "member_#{session[:member_id]}_#{Time.now.strftime('%Y%m%d%H%M%S')}#{File.extname(name).downcase}"
        File.open("public/img/members/#{name}", 'wb') { |f| f.write(file.read) }
        @image.full_path = "img/members/#{name}"
        if @image.save
          redirect_to account_images_path, notice: t('notice.created',{model: t('activerecord.models.image')})
        else
          @image_url = account_images_path
          render :new
        end
      end
    else
      @image.errors.add(:image, 'を指定してください。')
      @image_url = account_images_path
      render :new
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    if @image.update(image_params)
      redirect_to account_images_path, notice: t('notice.updated',{model: t('activerecord.models.image')})
    else
      @image_url = account_image_path(@image)
      render :edit
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    File.delete("public/img/members/#{name}")
    @image.destroy
    redirect_to account_images_path, notice: t('notice.deleted',{model: t('activerecord.models.image')})
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:image, :full_path, :member_id, :effective, :order)
    end
end
