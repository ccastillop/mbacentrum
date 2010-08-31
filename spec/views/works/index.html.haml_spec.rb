require 'spec_helper'

describe "works/index.html.haml" do
  before(:each) do
    assign(:works, [
      stub_model(Work,
        :name => "Name"
      ),
      stub_model(Work,
        :name => "Name"
      )
    ])
  end

  it "renders a list of works" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
