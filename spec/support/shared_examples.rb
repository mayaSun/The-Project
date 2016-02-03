shared_examples "slugable" do

  it "set the slug" do
    object.generate_slug!
    expect(object.slug).to_not be_nil
  end

end
