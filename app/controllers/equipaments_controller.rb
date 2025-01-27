class EquipamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_equipament, only: %i[ show edit update destroy ]

  # GET /equipaments
  # def index
  #   @equipaments = Equipament.all
  # end

  layout "admin"

  def index
    @equipaments = if params[:search].present?
                      Equipament.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
                   else
                      Equipament.order(:name, :serial_number)
                   end
    authorize(@equipaments)
  end

  # GET /equipaments/1
  def show
  end

  # GET /equipaments/new
  def new
    @equipament = Equipament.new
  end

  # GET /equipaments/1/edit
  def edit
    authorize @equipament
  end

  # POST /equipaments
  def create
    @equipament = Equipament.new(equipament_params)
    authorize @equipament

    if @equipament.save
      redirect_to equipaments_path, notice: "Equipament was successfully created."
    else
      Rails.logger.debug @equipament.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipaments/1
  def update
    authorize @equipament

    if @equipament.update(equipament_params)
      redirect_to @equipament, notice: "Equipament was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /equipaments/1
  def destroy
    authorize @equipament

    @equipament.destroy!
    redirect_to equipaments_url, notice: "Equipament was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipament
      @equipament = Equipament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipament_params
      params.require(:equipament).permit(:name, :serial_number, :category)
    end
end
