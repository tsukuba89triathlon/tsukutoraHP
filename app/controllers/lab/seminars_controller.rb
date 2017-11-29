class Lab::SeminarsController < ApplicationController
  before_action :set_lab_seminar, only: [:show, :edit, :update, :destroy]

  # GET /lab/seminars
  # GET /lab/seminars.json
  def index
    @lab_seminars = Lab::Seminar.all
  end

  # GET /lab/seminars/1
  # GET /lab/seminars/1.json
  def show
  end

  # GET /lab/seminars/new
  def new
    @lab_seminar = Lab::Seminar.new
  end

  # GET /lab/seminars/1/edit
  def edit
  end

  # POST /lab/seminars
  # POST /lab/seminars.json
  def create
    @lab_seminar = Lab::Seminar.new(lab_seminar_params)

    respond_to do |format|
      if @lab_seminar.save
        format.html { redirect_to @lab_seminar, notice: 'Seminar was successfully created.' }
        format.json { render :show, status: :created, location: @lab_seminar }
      else
        format.html { render :new }
        format.json { render json: @lab_seminar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lab/seminars/1
  # PATCH/PUT /lab/seminars/1.json
  def update
    respond_to do |format|
      if @lab_seminar.update(lab_seminar_params)
        format.html { redirect_to @lab_seminar, notice: 'Seminar was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab_seminar }
      else
        format.html { render :edit }
        format.json { render json: @lab_seminar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab/seminars/1
  # DELETE /lab/seminars/1.json
  def destroy
    @lab_seminar.destroy
    respond_to do |format|
      format.html { redirect_to lab_seminars_url, notice: 'Seminar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_seminar
      @lab_seminar = Lab::Seminar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_seminar_params
      params.fetch(:lab_seminar, {})
    end
end
