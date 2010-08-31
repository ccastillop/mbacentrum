require 'spec_helper'

describe "functions/index.html.haml" do
  before(:each) do
    assign(:functions, [
      stub_model(Function,
        :name => "Name"
      ),
      stub_model(Function,
        :name => "Name"
      )
    ])
  end

  it "renders a list of functions" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
