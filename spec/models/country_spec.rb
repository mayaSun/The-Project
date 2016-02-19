require 'spec_helper'

describe Country do 

  it {should validate_presence_of(:code)}

  it {should have_many(:brokers_countries)}
  it {should have_many(:brokers)}
  it {should have_many(:leads)}

end