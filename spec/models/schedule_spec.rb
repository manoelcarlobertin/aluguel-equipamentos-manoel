require 'rails_helper'

RSpec.describe EquipamentsController, type: :controller do
  let(:user) { create(:user) } # Usuário autenticado
  let(:equipament) { create(:equipament) } # Objeto do equipamento

  before do
    sign_in user # Autentica o usuário usando Devise
  end

  describe 'GET #index' do
    context 'quando o parâmetro search não é fornecido' do
      it 'retorna todos os equipamentos ordenados por nome e número de série' do
        equipament1 = create(:equipament, name: 'Equipamento B', serial_number: '123')
        equipament2 = create(:equipament, name: 'Equipamento A', serial_number: '456')

        get :index
        expect(assigns(:equipaments)).to eq([ equipament2, equipament1 ]) # Ordem esperada
        expect(response).to have_http_status(:ok)
      end
    end

    context 'quando o parâmetro search é fornecido' do
      it 'filtra os equipamentos por nome' do
        create(:equipament, name: 'Equipamento X')
        equipament_y = create(:equipament, name: 'Equipamento Y')

        get :index, params: { search: 'Y' }
        expect(assigns(:equipaments)).to eq([ equipament_y ])
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    it 'exibe o equipamento correto' do
      get :show, params: { id: equipament.id }
      expect(assigns(:equipament)).to eq(equipament)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'inicializa um novo equipamento' do
      get :new
      expect(assigns(:equipament)).to be_a_new(Equipament)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'autoriza e exibe o equipamento correto para edição' do
      expect_any_instance_of(Pundit::EquipamentPolicy).to receive(:edit?)
      get :edit, params: { id: equipament.id }
      expect(assigns(:equipament)).to eq(equipament)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'com parâmetros válidos' do
      it 'cria um novo equipamento e redireciona' do
        valid_params = { equipament: attributes_for(:equipament) }

        expect {
          post :create, params: valid_params
        }.to change(Equipament, :count).by(1)

        expect(response).to redirect_to(equipaments_path)
        expect(flash[:notice]).to eq('Equipament was successfully created.')
      end
    end

    context 'com parâmetros inválidos' do
      it 'não cria o equipamento e renderiza o formulário novamente' do
        invalid_params = { equipament: { name: '', serial_number: '' } }

        expect {
          post :create, params: invalid_params
        }.not_to change(Equipament, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'com parâmetros válidos' do
      it 'atualiza o equipamento e redireciona' do
        valid_params = { id: equipament.id, equipament: { name: 'Novo Nome' } }
        patch :update, params: valid_params

        expect(equipament.reload.name).to eq('Novo Nome')
        expect(response).to redirect_to(equipament)
        expect(flash[:notice]).to eq('Equipament was successfully updated.')
      end
    end

    context 'com parâmetros inválidos' do
      it 'não atualiza o equipamento e renderiza o formulário novamente' do
        invalid_params = { id: equipament.id, equipament: { name: '' } }
        patch :update, params: invalid_params

        expect(equipament.reload.name).not_to eq('')
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'autoriza e exclui o equipamento' do
      equipament # Cria o equipamento

      expect {
        delete :destroy, params: { id: equipament.id }
      }.to change(Equipament, :count).by(-1)

      expect(response).to redirect_to(equipaments_url)
      expect(flash[:notice]).to eq('Equipament was successfully destroyed.')
    end
  end
end
