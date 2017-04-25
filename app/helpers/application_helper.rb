module ApplicationHelper
  def admin_types
    ['AdminRepresentative']
  end

  def admin?
    admin_types.include?(current_representative.type)
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, :title => "BizChat", :sticky => false, :time => 1000)
  end

end
