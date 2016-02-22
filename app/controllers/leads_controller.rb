class LeadsController <ApplicationController

  require 'net/http'
  skip_before_filter  :verify_authenticity_token

  def create
    unless country = Country.find_by(code: params[:country_code])
      country = Country.create(code: params[:country_code])
    end
    if lead = Lead.create(name: params[:name], email: params[:email], phone: params[:phone], country_id: country.id)
      # Post to ctoption
      uri = URI('http://lp.ctoption.com/api/accountregistration.php')
      res = Net::HTTP.post_form( uri, 
                                'FirstName' => lead.first_name, 
                                'LastName' => lead.last_name, 
                                'Email' => lead.email, 
                                'CountryCode' => params[:country_code],
                                'RegCountryCode' => params[:country_code], # If no GEOIP information is available, copy the CountryCode value.
                                'CurrencyCode' => 'USD', # Either "USD", "EUR" or "GBP"
                                'PhoneCountryCode' => country.phone_country_code, 
                                'PhoneAreaCode' => '',
                                'Phone' => lead.phone,
                                'City' => '', 
                                'AffID' => '4025|from=maya',
                                'affiliate_id' => '4025|from=maya',
                                'Campaign' => '', # If no GEOIP information is available, copy the CountryCode value.
                                'LangID' => '' # May be left empty
                                )
    # Get ctoption password
    lead.analyze_ctoption_response(res.body)
    end
    xml = Builder::XmlMarkup.new(:indent => 2)
    xml.instruct!(:xml, :version=>"1.0", :encoding => "UTF-8", :standalone => "yes")
    xml.lead { |s| s.username(lead.email); s.password(lead.password) }
    render xml: xml.target!  
  end

end


