class ApplicationController < ActionController::Base
  before_action :configure_sign_out_flash, if: :devise_controller?
  include Pundit::Authorization

  # Resgata erros de autorização e redireciona ou exibe mensagens personalizadas
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def admin?
    role == "admin"
  end

  private

  def configure_sign_out_flash
    flash.discard(:notice) if request.format.turbo_stream?
  end

  # Verifica se o usuário é administrador antes de permitir acessar uma action
  def authorize_admin
    authorize User, :admin? unless admin?
  end

  # Mensagem personalizada para erros de autorização
  def user_not_authorized
    # policy_name = policy(record).class.to_s.underscore

    flash[:alert] = I18n.t("errors.authorization.default",
              default: "Você não tem permissão para executar essa ação como #{current_user.email}.")

    logger.warn "Acesso não autorizado: #{current_user.email} tentou acessar #{request.path}"


  end

    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern
end
