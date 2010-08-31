require 'spec_helper'

describe "works/new.html.haml" do
  before(:each) do
    assign(:work, stub_model(Work,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new work form" do
    render

    rendered.should have_selector("form", :action => works_path, :method => "post") do |form|
      form.should have_selector("input#work_name", :name => "work[name]")
    end
  end
end
