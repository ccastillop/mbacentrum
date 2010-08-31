require 'spec_helper'

describe "levels/index.html.haml" do
  before(:each) do
    assign(:levels, [
      stub_model(Level,
        :name => "Name"
      ),
      stub_model(Level,
        :name => "Name"
      )
    ])
  end

  it "renders a list of levels" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
