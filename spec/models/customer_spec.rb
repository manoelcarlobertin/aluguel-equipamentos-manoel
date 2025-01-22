require 'rails_helper'

RSpec.describe Customer, type: :model do
  # Teste de validações
  describe "validations" do
    let(:customer) { Customer.new(name: "Jane Doe", dob: "1990-01-01", email: "jane.doe@example.com", mobile_phone: "1234567890") }

    it "is valid with valid attributes" do
      customer = Customer.new(
        name: "Jane Doe",
        dob: "1990-01-01",
        email: "jane.doe@example.com",
        mobile_phone: "1234567890"
      )
      expect(customer).to be_valid
    end

    it "is invalid without a name" do
      customer = Customer.new(name: nil)
      expect(customer).not_to be_valid
      expect(customer.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a date of birth" do
      customer = Customer.new(dob: nil)
      expect(customer).not_to be_valid
      expect(customer.errors[:dob]).to include("can't be blank")
    end

    it "is invalid without an email" do
      customer = Customer.new(email: nil)
      expect(customer).not_to be_valid
      expect(customer.errors[:email]).to include("can't be blank")
    end

    it "is invalid with an improperly formatted email" do
      customer = Customer.new(email: "invalid_email")
      expect(customer).not_to be_valid
      expect(customer.errors[:email]).to include("is invalid")
    end

    it "is invalid without a mobile phone" do
      customer = Customer.new(mobile_phone: nil)
      expect(customer).not_to be_valid
      expect(customer.errors[:mobile_phone]).to include("can't be blank")
    end
  end

  # Teste de métodos de instância (se necessário)
  describe "#full_details" do
    it "returns a formatted string with name and email" do
      customer = Customer.new(
        name: "Jane Doe",
        email: "jane.doe@example.com"
      )
      expect(customer.full_details).to eq("Jane Doe <jane.doe@example.com>")
    end
  end
end
