# == Schema Information
#
# Table name: leads
#
#  id          :integer          not null, primary key
#  name        :string
#  email       :string
#  phone       :string
#  site_id     :integer
#  language_id :integer
#  country_id  :integer
#  password    :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Lead <ActiveRecord::Base

  validates_presence_of :email, :name, :phone, :country_id

  has_many :brokers_leads
  has_many :brokers , through: :brokers_leads
 
  belongs_to :site
  belongs_to :language
  belongs_to :country

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

  rails_admin do
    list do
      filters [:name, :email, :site, :language, :country, :created_at]
      fields :name, :email, :site, :language, :country, :created_at
      field :brokers do
        label 'Brokers'
        pretty_value do
          bindings[:view].link_to(bindings[:object].brokers.count, nil)#admin_lead_path())
        end
      end
    end

    show do
      fields :name, :email, :password, :site, :language, :country, :brokers
    end
  end

end

