require File.expand_path('../config/environment', __dir__)

RSpec.configure do |config|
  config.before(:suite) do
    Faker::UniqueGenerator.clear # Reseta valores únicos antes dos testes
  end
end

# Isso permitirá que você use create(:category) e build(:category) diretamente nos testes.
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
