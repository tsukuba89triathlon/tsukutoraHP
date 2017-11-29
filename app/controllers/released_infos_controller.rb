class ReleasedInfosController < ApplicationController
  before_action :set_released_info, only: [:show, :edit, :update, :destroy]

  # GET /released_infos
  # GET /released_infos.json
  def index
    @released_infos = ReleasedInfo.paginate(page: params[:page],per_page: 20)
  end

  # GET /released_infos/1
  # GET /released_infos/1.json
  def show
  end

  # GET /released_infos/new
  def new
    @released_info = ReleasedInfo.new
  end

  # GET /released_infos/1/edit
  def edit
  end

  # POST /released_infos
  # POST /released_infos.json
  def create
    @released_info = ReleasedInfo.new(released_info_params)

    respond_to do |format|
      if @released_info.save
        format.html { redirect_to @released_info, notice: 'Released info was successfully created.' }
        format.json { render :show, status: :created, location: @released_info }
      else
        format.html { render :new }
        format.json { render json: @released_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /released_infos/1
  # PATCH/PUT /released_infos/1.json
  def update
    respond_to do |format|
      if @released_info.update(released_info_params)
        format.html { redirect_to @released_info, notice: 'Released info was successfully updated.' }
        format.json { render :show, status: :ok, location: @released_info }
      else
        format.html { render :edit }
        format.json { render json: @released_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /released_infos/1
  # DELETE /released_infos/1.json
  def destroy
    @released_info.destroy
    respond_to do |format|
      format.html { redirect_to released_infos_url, notice: 'Released info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_released_info
      @released_info = ReleasedInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def released_info_params
      params.require(:released_info).permit(:date, :body)
    end
end
