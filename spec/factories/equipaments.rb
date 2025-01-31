# spec/factories/equipaments.rb
FactoryBot.define do
  factory :equipament do
    # category { create(:category) }
    # user { create(:user) }  # Adicionando o usuário obrigatório
    association :category # Agora usa o factory :category, que gera nomes únicos
    association :user
    sequence(:name) { |n| "Equipament #{n}" } # Garante nomes únicos
    sequence(:serial_number) { |n| "SN#{n}" } # Evita duplicidade
    description { Faker::Lorem.paragraph }
    # status { :available } # Ou outro status válido
    # price { Faker::Number.decimal(digits: 2) }

    # Adicionando a imagem do equipamento
    after(:build) do |equipament|
      # Carregar uma imagem aleatória da pasta app/assets/images/
      equipament.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', '*.png').sample),
      filename: 'image.png', content_type: 'image/png')
    end

    # Traits para facilitar a criação de equipamentos com status específicos
    trait :available do
      status { :available }
    end

    trait :rented do
      status { :rented }
    end

    trait :maintenance do
      status { :maintenance }
    end

    # Fábrica para equipamento com imagem
    trait :with_image do
      after(:build) do |equipament|
        equipament.image.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'sample_image.png')),
          filename: 'sample_image.png',
          content_type: 'image/png'
        )
      end
    end

    # Fábrica para equipamento sem descrição
    trait :without_description do
      description { nil }
    end

    # Fábrica para equipamento com nome e serial_number exclusivos
    trait :unique_name_and_serial do
      name { Faker::Device.model_name }
      serial_number { Faker::Alphanumeric.alphanumeric(number: 10).upcase }
    end
  end
end
