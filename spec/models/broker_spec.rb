require 'spec_helper'

describe Broker do 

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}

  it {should have_many(:brokers_campaigns)}
  it {should have_many(:campaigns)}
  it {should have_many(:brokers_countries)}
  it {should have_many(:countries)}
  it {should have_many(:leads)}
  it {should have_many(:languages)}

  it_behaves_like "slugable" do
    let(:object) { Fabricate(:broker) }
  end

end