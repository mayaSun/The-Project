class LeadsController <ApplicationController

  require 'net/http'
  skip_before_filter  :verify_authenticity_token

  def create
    xml = Builder::XmlMarkup.new(:indent => 2)
    xml.instruct!(:xml, :version=>"1.0", :encoding => "UTF-8", :standalone => "yes")
    if Lead.create(name: params[:name], email: params[:email], phone: params[:phone], country_id: 1)
      site = Site.first
    else
      site = Site.first
    end
    xml.site { |s| s.url(site.url); s.name(site.name) }
    render xml: xml  
  end

end


