require 'spec_helper'

describe Lead do 

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:phone)}
  it {should validate_presence_of(:country_id)}

  it {should have_many(:brokers_leads)}
  it {should have_many(:brokers)}

  it {should belong_to(:site)}
  it {should belong_to(:language)}
  it {should belong_to(:country)}


end