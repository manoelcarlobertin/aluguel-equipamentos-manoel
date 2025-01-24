require 'rails_helper'

RSpec.describe EquipamentsController, type: :controller do
  let(:valid_attributes) do
    {
      name: "Drill",
      serial_number: SecureRandom.hex(6), # Gera um número único aleatório
      category: "Tool"
    }
  end

  let(:invalid_attributes) do
    { name: "", serial_number: SecureRandom.hex(6), category: "Tool" }
  end

  let!(:equipament) { Equipament.create!(valid_attributes) }

  describe "GET actions" do
    describe "GET #index" do
      it "returns a successful response and assigns @equipaments" do
        get :index
        expect(response).to be_successful
        expect(assigns(:equipaments)).to eq([ equipament ])
      end
    end

    describe "GET #show" do
      it "returns a successful response and assigns @equipament" do
        get :show, params: { id: equipament.id }
        expect(response).to be_successful
        expect(assigns(:equipament)).to eq(equipament)
      end
    end

    describe "GET #new" do
      it "assigns a new equipament as @equipament" do
        get :new
        expect(assigns(:equipament)).to be_a_new(Equipament)
      end
    end

    describe "GET #edit" do
      it "assigns the requested equipament as @equipament" do
        get :edit, params: { id: equipament.id }
        expect(assigns(:equipament)).to eq(equipament)
      end
    end
  end

  describe "POST #create" do
    # context "with valid parameters" do
    #   it "creates a new Equipament and redirects to it" do
    #     expect {
    #       post :create, params: { equipament: valid_attributes }
    #     }.to change(Equipament, :count).by(1)

    #     expect(response).to redirect_to(Equipament.last)
    #   end
    # end

    context "with invalid parameters" do
      it "does not create a new Equipament" do
        expect {
          post :create, params: { equipament: invalid_attributes }
        }.not_to change(Equipament, :count)
      end

      it "renders the :new template with unprocessable_entity status" do
        post :create, params: { equipament: invalid_attributes }
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH/PUT #update" do
    context "with invalid parameters" do
      it "does not update the equipament" do
        patch :update, params: { id: equipament.id, equipament: invalid_attributes }
        equipament.reload
        expect(equipament.name).to eq("Drill")
      end

      it "renders the :edit template with unprocessable_entity status" do
        patch :update, params: { id: equipament.id, equipament: invalid_attributes }
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
