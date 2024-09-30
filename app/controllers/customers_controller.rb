class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_customer, only: %i[ show edit update destroy ]

  def index
    @customers = Customer.order(:name)
  end

  # 1ª linha """ tenho que executar minha consulta query.
  # 2ª limha  ligado para não haver duplicidade de registro."""
  def search
    @customers = Customer.where("lower(name) ILIKE ?", "%#{params[:query]}%".downcase)
    @customers = [] if @customers.nil? # Inicializa como array vazio se for nil
     # @q = Customer.ransack(params[:q])
     # @customer = @q.result(distinct: true)

     render layout: false
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: "Customer was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: "Customer was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy!

    respond_to do |format|
      format.html { redirect_to customers_path, status: :see_other, notice: "Customer was successfully destroyed." }
    end
  end

  private

  def authenticate_customer!
    unless current_customer
      redirect_to new_customer_session_path, alert: "Você precisa estar logado como cliente para acessar essa página."
    end
  end

    def load_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :dob, :email, :mobile_phone, :address, :indentification)
    end
end
