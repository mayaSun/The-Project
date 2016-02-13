class LeadsController <ApplicationController

  require 'net/http'
  skip_before_filter  :verify_authenticity_token

  def create
    builder = Builder::XmlMarkup.new   
    if Lead.create(name: params[:name], email: params[:email], phone: params[:phone], country_id: 1)
      site = Site.first
    else
      site = Site.first
    end
    xml = builder.site { |s| s.url(site.url); s.name(site.name) }
    render xml: xml
  end

end
