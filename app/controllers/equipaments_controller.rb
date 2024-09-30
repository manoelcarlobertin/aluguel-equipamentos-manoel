class EquipamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_equipament, only: %i[ show edit update destroy ]

  def index
    @equipaments = Equipament.order(:name)
  end

  # 1ª linha """ tenho que executar minha consulta query.
  # 2ª limha  ligado para não haver duplicidade de registro."""
  def search
    @equipaments = Equipament.where("lower(name) ILIKE ?", "%#{params[:query]}%".downcase)
    @equipaments = [] if @equipaments.nil? # Inicializa como array vazio se for nil
     # @q = Equipament.ransack(params[:q])
     # @equipament = @q.result(distinct: true)

     render layout: false
  end

  def show
  end

  def new
    @equipament = Equipament.new
  end

  def edit
  end

  def create
    @equipament = Equipament.new(equipament_params)

    respond_to do |format|
      if @equipament.save
        format.html { redirect_to @equipament, notice: "Equipament was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @equipament.update(equipament_params)
        format.html { redirect_to @equipament, notice: "Equipament was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @equipament.destroy!

    respond_to do |format|
      format.html { redirect_to equipaments_path, status: :see_other, notice: "Equipament was successfully destroyed." }
    end
  end

  private

  def authenticate_equipament!
    unless current_equipament
      redirect_to new_equipament_session_path, alert: "Você precisa estar logado como cliente para acessar essa página."
    end
  end

  def load_equipament
    @equipament = Equipament.find(params[:id])
  end

  def equipament_params
    params.require(:equipament).permit(:name, :serial_number)
  end
end
