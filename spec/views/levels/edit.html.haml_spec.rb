require 'spec_helper'

describe "levels/edit.html.haml" do
  before(:each) do
    @level = assign(:level, stub_model(Level,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit level form" do
    render

    rendered.should have_selector("form", :action => level_path(@level), :method => "post") do |form|
      form.should have_selector("input#level_name", :name => "level[name]")
    end
  end
end
