class EquipamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_equipament, only: %i[show edit update destroy]
  layout "admin"

  def index
    # Buscar equipamentos com base na pesquisa ou listar todos
    @equipaments = if params[:search].present?
                     Equipament.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
                   else
                     Equipament.order(:name, :serial_number)
                   end

    authorize(@equipaments)  # Autoriza o acesso à lista de equipamentos
  end

  def show
    # Aqui você pode adicionar qualquer lógica extra, caso necessário
  end

  def new
    @equipament = Equipament.new
    authorize @equipament
  end

  def edit
    authorize @equipament
  end

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

  def update
    authorize @equipament

    if @equipament.update(equipament_params)
      redirect_to @equipament, notice: "Equipament was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @equipament

    @equipament.destroy!
    redirect_to equipaments_url, notice: "Equipament was successfully destroyed.", status: :see_other
  end

  private

  # Callback para configurar o equipamento com base no ID.
  def set_equipament
    @equipament = Equipament.find(params[:id])
  end

  # Apenas parâmetros confiáveis são permitidos.
  def equipament_params
    params.require(:equipament).permit(:name, :description, :status, :category_id, :serial_number, :price, :image_url)
  end
end
