require 'rails_helper'

RSpec.describe Equipament, type: :model do
  # Validações
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:serial_number) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image) }
  it { should validate_uniqueness_of(:serial_number) }

  # Associações
  it { should belong_to(:category) }
  it { should have_one_attached(:image) }

  # Enum de status
  describe 'enum status' do
    it 'defines available, rented, and maintenance statuses with correct values' do
      expect(Equipament.statuses).to eq({ "available" => 0, "rented" => 1, "maintenance" => 2 })
    end
  end

  # Métodos de instância
  let(:user) { create(:user) }
  let(:equipament) { create(:equipament, user: user, status: :maintenance, name: Faker::Device.model_name) }

  shared_examples_for 'status method' do |status_method, status_value|
    it "returns true if status is #{status_value}" do
      equipament.status = status_value
      expect(equipament.send(status_method)).to be true
    end

    it "returns false if status is not #{status_value}" do
      other_status = (Equipament.statuses.keys - [status_value.to_s]).sample.to_sym # Pega um status diferente aleatoriamente
      equipament.status = other_status
      expect(equipament.send(status_method)).to be false
    end
  end
end
