# == Schema Information
#
# Table name: leads
#
#  id                :integer          not null, primary key
#  name              :string
#  email             :string
#  phone             :string
#  site_id           :integer
#  language_id       :integer
#  country_id        :integer
#  ctoption_password :string
#  created_at        :datetime
#  updated_at        :datetime
#

class Lead <ActiveRecord::Base

  validates_presence_of :email, :phone
  validates_uniqueness_of :email

  has_many :brokers_leads
  has_many :brokers , through: :brokers_leads
 
  belongs_to :site
  belongs_to :language
  belongs_to :country

  before_save :set_name_if_not_exist

  def set_name_if_not_exist
    if name.nil? || name.empty?
      self.name = email.split('@').first
    end
  end

  def first_name
    if name.split.count > 1
      name.split[0..-2].join(' ')
    else
      name
    end
  end

  def last_name
    if name.split.count > 1
      name.split.last
    else
      name
    end
  end

  def analyze_ctoption_response(res_body)
    arr = res_body.split(/\W+/)
    if arr.index("Code") && arr[arr.index("Code") + 1] == '0'
      self.password = arr[arr.index("Password") + 1] unless arr.index("Password").nil?
      self.save
    end
  end

  def build_cpoption_welcome_url
    "https://ctoption.com/alogin.aspx?username=#{email}&password=#{password}&url=/en/my-account/welcome-greetings.aspx"
  end


  def self.create_leads_from_exhel_file(file_name, from=nil)

    begin
      xlsx = Roo::Spreadsheet.open(file_name, extension: :xlsx)
    rescue Zip::Error
      xlsx = Roo::Spreadsheet.open(file_name)
    end

    failed_ids = []
    (0..xlsx.sheet(0).last_row).each do |i|
      puts "line: " + i.to_s
      row = xlsx.sheet(0).row(i)
      country_name = row[2].nil? ? nil : row[2].strip.gsub(/[^\w\s]/, '')
      country = Country.find_by(name: country_name) || Country.create(name: country_name)
        
      lead = Lead.create(from_db: from, country_id: country.id, name: row[1], phone: row[3], email: row[4], created_at: row[5], account_balance: row[7], currency: row[8])
      
      if lead.id.nil?
        failed_ids << i
        puts "line " + i.to_s + " lead create failed"
      end
    end
    failed_ids
  end

  rails_admin do
    list do
      filters [:site, :country, :created_at]
      fields :name, :email, :site, :country, :created_at
      field :brokers do
        label 'Brokers'
        pretty_value do
          bindings[:view].link_to(bindings[:object].brokers.count, nil)#admin_lead_path())
        end
      end
      field :language
    end

    show do
      fields :name, :email, :ctoption_password, :site, :language, :country, :brokers
    end
  end

end

