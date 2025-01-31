require "active_support/core_ext/integer/time"

# O ambiente de teste é usado exclusivamente para executar a suíte de testes da aplicação.
# Você nunca precisa trabalhar com ele fora disso. Lembre-se de que o banco de dados de teste
# é um "espaço temporário" para a suíte de testes e é limpo e recriado entre execuções de testes.
# Não dependa dos dados presentes nele!

Rails.application.configure do
  # Configurações especificadas aqui têm precedência sobre as definidas em config/application.rb.
  config.cache_classes = false

  # O modo de desenvolvimento é desativado por padrão para evitar problemas com
  # o cache, o log e a saída de erros. Em um ambiente de produção, você deve habilitar

  config.raise_errors_for_deprecations = true
  # Transforma avisos de depreciação em erros para obter um backtrace completo

  # Define os caminhos para carregar fixtures.
  config.fixture_paths = [
    "#{Rails.root}/test/fixtures",
    "#{Rails.root}/spec/models"
  ]

  # Durante a execução dos testes, os arquivos não são monitorados, e a recarga não é necessária.
  config.enable_reloading = false

  # O eager loading carrega toda a aplicação. Ao executar um único teste localmente,
  # isso geralmente não é necessário e pode tornar a suíte de testes mais lenta.
  # No entanto, é recomendável habilitá-lo em sistemas de integração contínua (CI)
  # para garantir que o eager loading funcione corretamente antes de implantar o código.
  config.eager_load = ENV["CI"].present?

  # Configura o servidor de arquivos públicos para testes com Cache-Control para melhor desempenho.
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{1.hour.to_i}"
  }

  # Exibe relatórios completos de erros e desabilita o cache.
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # Renderiza templates de exceção para exceções resgatáveis e levanta exceções para outras.
  config.action_dispatch.show_exceptions = :rescuable

  # Desabilita a proteção contra falsificação de solicitações (CSRF) no ambiente de teste.
  config.action_controller.allow_forgery_protection = false

  # Armazena arquivos enviados no sistema de arquivos local em um diretório temporário.
  config.active_storage.service = :test

  # Desabilita o cache para templates do Action Mailer, mesmo que o cache do Action Controller esteja habilitado.
  config.action_mailer.perform_caching = false

  # Define o método de entrega de e-mails como :test, que acumula e-mails enviados no array ActionMailer::Base.deliveries.
  config.action_mailer.delivery_method = :test

  # Define as opções padrão de URL para o Action Mailer.
  # Como os mailers não têm contexto da requisição, é necessário fornecer o parâmetro :host manualmente.
  config.action_mailer.default_url_options = { host: "www.example.com" }

  # Exibe avisos de depreciação no stderr.
  config.active_support.deprecation = :stderr

  # Levanta exceções para depreciações não permitidas.
  config.active_support.disallowed_deprecation = :raise

  # Define quais mensagens de depreciação são proibidas.
  config.active_support.disallowed_deprecation_warnings = []

  # Levanta erros para traduções ausentes.
  # config.i18n.raise_on_missing_translations = true

  # Anota a visualização renderizada com os nomes dos arquivos.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Levanta erros quando as opções only/except de before_action referenciam ações ausentes.
  config.action_controller.raise_on_missing_callback_actions = true
end
