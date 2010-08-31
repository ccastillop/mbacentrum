require 'spec_helper'

describe "mbas/show.html.haml" do
  before(:each) do
    @mba = assign(:mba, stub_model(Mba,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
  end
end
