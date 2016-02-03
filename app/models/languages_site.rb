# == Schema Information
#
# Table name: languages_sites
#
#  id          :integer          not null, primary key
#  language_id :ingeter
#  site_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class LanguagesSite <ActiveRecord::Base
  belongs_to :site
  belongs_to :language
end
