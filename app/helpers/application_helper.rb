module ApplicationHelper
  def admin_types
    ['AdminRepresentative']
  end

  def admin?
    admin_types.include?(current_representative.type)
  end
end
