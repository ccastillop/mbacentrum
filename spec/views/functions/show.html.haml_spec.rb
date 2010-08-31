require 'spec_helper'

describe "functions/show.html.haml" do
  before(:each) do
    @function = assign(:function, stub_model(Function,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
  end
end
