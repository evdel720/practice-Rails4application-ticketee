class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    #right. because viewer doesn't have to be explicitly indicated.
    #since show action just needs any role.
    user.try(:admin?) || record.project.roles.exists?(user_id: user)
  end
end
