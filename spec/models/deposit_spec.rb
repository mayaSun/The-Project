require 'spec_helper'

describe Deposit do 

  it {should validate_presence_of(:brokers_lead_id)}
  it {should validate_presence_of(:amount)}
  it {should validate_presence_of(:currency)}  

  it {should belong_to(:brokers_lead)}

end