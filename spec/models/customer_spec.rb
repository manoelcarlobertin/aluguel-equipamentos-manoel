# spec/models/customer_spec.rb
require 'rails_helper'

RSpec.describe Customer, type: :model do
  # Teste de presença para :name, :dob, :email e :mobile_phone
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:dob) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:mobile_phone) }

  # Teste de associação - se a associação for habilitada
  it { should have_many(:orders).dependent(:destroy) }
  it { should have_many(:products).through(:orders) }


  # Teste de unicidade para :email
  it { should validate_uniqueness_of(:email) }

  # Teste de formato para :email (deve ser um email válido)
  it { should allow_value('customer@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }

  # Teste de formato para :mobile_phone (deve ter entre 10 e 15 dígitos)
  it { should allow_value('1234567890').for(:mobile_phone) }
  it { should allow_value('123456789012345').for(:mobile_phone) }
  it { should_not allow_value('12345').for(:mobile_phone) }
  it { should_not allow_value('1234567890123456').for(:mobile_phone) }

  # Teste para garantir que o método full_details concatena corretamente o nome e o email
  describe '#full_details' do
    let(:customer) { Customer.new(name: "John Doe", email: "john.doe@example.com") }

    it "returns the full details in the correct format" do
      expect(customer.full_details).to eq("John Doe <john.doe@example.com>")
    end
  end
end
