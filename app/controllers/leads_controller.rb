class LeadsController <ApplicationController

  require 'net/http'
  skip_before_filter  :verify_authenticity_token

  def create
    # Sanitize params
    sanitizer = Rails::Html::FullSanitizer.new
    name = sanitizer.sanitize(params[:name])
    email = sanitizer.sanitize(params[:email])
    phone = sanitizer.sanitize(params[:phone])
    country_code = sanitizer.sanitize(params[:country_code])
    # Find or create country
    unless country = Country.find_by(code: country_code)
      country = Country.create(code: country_code)
    end
    lead = Lead.find_by(email: email)
    if lead ||= Lead.create(name: name, email: email, phone: phone, country_id: country.id)
      # Post to ctoption
      uri = URI('http://lp.ctoption.com/api/accountregistration.php')
      res = Net::HTTP.post_form( uri, 
                                'FirstName' => lead.first_name, 
                                'LastName' => lead.last_name, 
                                'Email' => lead.email, 
                                'CountryCode' => country_code,
                                'RegCountryCode' => country_code, # If no GEOIP information is available, copy the CountryCode value.
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
      Get ctoption password
      lead.analyze_ctoption_response(res.body)
    end
    url = lead.build_cpoption_welcome_url
    xml = Builder::XmlMarkup.new(:indent => 2)
    xml.instruct!(:xml, :version=>"1.0", :encoding => "UTF-8", :standalone => "yes")
    xml.lead { |s| s.url(url) }
    
    render xml: xml.target!  
  end

end


