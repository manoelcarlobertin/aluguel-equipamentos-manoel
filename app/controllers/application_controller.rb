class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Resgata erros de autorização e redireciona ou exibe mensagens personalizadas
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def admin?
    role == "admin"
  end

  private

  # Verifica se o usuário é administrador antes de permitir acessar uma action
  def authorize_admin
    authorize User, :admin? unless admin?
  end

  # Mensagem personalizada para erros de autorização
  def user_not_authorized
    flash[:alert] = "Você não tem permissão para acessar esta página."
    redirect_to(request.referrer || root_path)
    # raise ActionController::RoutingError.new('Not Found') if request.xhr?
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
