require 'spec_helper'

describe "levels/show.html.haml" do
  before(:each) do
    @level = assign(:level, stub_model(Level,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
  end
end
