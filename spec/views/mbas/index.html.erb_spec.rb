require 'spec_helper'

describe "mbas/index.html.erb" do
  before(:each) do
    assign(:mbas, [
      stub_model(Mba,
        :name => "Name"
      ),
      stub_model(Mba,
        :name => "Name"
      )
    ])
  end

  it "renders a list of mbas" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
