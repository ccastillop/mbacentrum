require 'spec_helper'

describe "works/show.html.haml" do
  before(:each) do
    @work = assign(:work, stub_model(Work,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
  end
end
