require 'rails_helper'


RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:equipaments) }
  end

  describe 'validations' do
    subject { build(:category) } # Usa `build` para evitar erro de duplicação

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'database constraints' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_index(:name).unique(true) }
  end
end
