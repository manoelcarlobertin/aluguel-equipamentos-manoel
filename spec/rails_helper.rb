require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'
if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end

require 'rspec/rails'

# Verifica e aplica migrações pendentes antes de rodar os testes
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Configura caminhos para fixtures
  config.fixture_path = Rails.root.join('spec/fixtures')

  # Define uso de transações para os testes
  config.use_transactional_fixtures = true

  # Configurações para limpeza do banco de dados
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # Filtra linhas irrelevantes de backtraces do Rails e de gems
  config.filter_rails_from_backtrace!


  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
