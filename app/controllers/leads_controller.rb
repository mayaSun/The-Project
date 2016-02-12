class LeadsController <ApplicationController

  def create
    if Lead.create(name: params[name], email: params[:email], phone: params[:phone], country_id: 1)

    else

    end
  end

end
