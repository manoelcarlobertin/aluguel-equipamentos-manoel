FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' }
    # Adicione outros atributos necessários para o seu modelo User aqui
  end
end
