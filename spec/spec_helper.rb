# Este arquivo é carregado antes de qualquer teste
RSpec.configure do |config|
  # Ativa a verificação de expectativa para garantir que as expectativas sejam escritas corretamente
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Configuração do Mocking (dobragem de objetos para simular comportamentos)
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Permite rodar testes aleatoriamente para evitar dependências ocultas entre eles
  config.order = :random

  # Se ativado, falhas em um teste interrompem a execução dos próximos
  # config.fail_fast = true

  # Filtragem de testes (útil para rodar apenas testes com determinadas tags)
  config.filter_run_when_matching :focus

  # Habilita a filtragem de linhas específicas para rodar testes isolados
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Inclui a configuração para rodar apenas testes que falharam na última execução
  # config.only_failures = true

  # Desativa a saída colorida no terminal (ativado por padrão)
  # config.color = false

  # Verifica se existem testes pendentes ou desativados (útil para debugging)
  config.warnings = true
end
