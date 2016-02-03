require 'spec_helper'

describe Campaign do 

  it {should validate_presence_of(:name)}

  it {should have_many(:brokers_campaigns)}
  it {should have_many(:brokers)}
  it {should have_many(:sites)}

  it_behaves_like "slugable" do
    let(:object) { Fabricate(:campaign) }
  end

end