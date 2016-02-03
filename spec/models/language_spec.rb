require 'spec_helper'

describe Language do 

  it {should validate_presence_of(:name)}

  it {should have_many(:brokers_languages)}
  it {should have_many(:brokers)}
  it {should have_many(:languages_sites)}
  it {should have_many(:sites)}
  it {should have_many(:leads)}

end