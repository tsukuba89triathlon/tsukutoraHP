class Admin::ImagesController < ApplicationController
  layout 'admin'
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /images
  # GET /images.json
  def index
    @images = Admin::Image.public_images.includes(:image_target)
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Admin::Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    params[:admin_image][:effective] = true
    @image = Admin::Image.new(image_params)
    file = params[:admin_image][:image] # ファイルを取得
    name = file.original_filename #ファイルのベース名
    permits = ['.jpeg','.jpg','.gif','png']
    if !permits.include?(File.extname(name).downcase)
      @image.errors.add(:image, 'の拡張子が正しくありません。')
      render :new
    elsif file.size > 10.megabyte
      @image.errors.add(:image, 'のサイズが大きすぎます。10MBまでです。')
      render :new
    else
      name = "#{@image.image_target.target}_#{Time.now.strftime('%Y%m%d%H%M%S')}#{File.extname(name).downcase}"
      File.open("public/#{@image.image_target.path}/#{name}", 'wb') { |f| f.write(file.read) }
      @image.full_path = "#{@image.image_target.path}/#{name}"
      @image.save
      redirect_to admin_images_path, notice: '画像及び画像情報は正常に登録されました。'
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to admin_images_path, notice: '画像情報は正常に更新されました。' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    File.delete("public/#{@image.full_path}")
    @image.destroy
    respond_to do |format|
      format.html { redirect_to admin_images_url, notice: '画像及び画像情報は正常に削除されました。' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Admin::Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:admin_image).permit(:image, :full_path, :image_target_id, :effective)
    end
end
