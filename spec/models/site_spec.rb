require 'spec_helper'

describe Site do 

  it {should validate_presence_of(:name)}

  it {should have_many(:leads)}
  it {should have_many(:languages_sites)}
  it {should have_many(:languages)}

  it {should belong_to(:campaign)}

  it_behaves_like "slugable" do
    let(:object) { Fabricate(:site) }
  end

end