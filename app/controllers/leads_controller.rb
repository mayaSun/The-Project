class LeadsController <ApplicationController

  require 'net/http'
  skip_before_filter  :verify_authenticity_token

  def create
    if Lead.create(name: params[:name], email: params[:email], phone: params[:phone], country_id: 1)
      render xml: Site.first
    else
      render xml: Site.first
    end
  end

end
