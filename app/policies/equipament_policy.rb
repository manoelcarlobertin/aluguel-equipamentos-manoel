class EquipamentPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present? # Permitir que apenas usuários autenticados criem equipamentos
  end

  def update?
    user.present? # Ajuste conforme sua lógica
  end

  def destroy?
    user.present? # Ajuste conforme sua lógica
  end

  # Adicione outros métodos, se necessário

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
