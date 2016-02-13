class LeadsController <ApplicationController

  require 'net/http'
  skip_before_filter  :verify_authenticity_token

  def create
    xml = Builder::XmlMarkup.new
    xml.instruct!(:xml, :encoding => "UTF-8")   
    if Lead.create(name: params[:name], email: params[:email], phone: params[:phone], country_id: 1)
      site = Site.first
    else
      site = Site.first
    end
    xml.site(:site => site.url, :name => site.name)
    render xml: xml
  end

end
