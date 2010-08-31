require 'spec_helper'

describe "levels/new.html.haml" do
  before(:each) do
    assign(:level, stub_model(Level,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new level form" do
    render

    rendered.should have_selector("form", :action => levels_path, :method => "post") do |form|
      form.should have_selector("input#level_name", :name => "level[name]")
    end
  end
end
