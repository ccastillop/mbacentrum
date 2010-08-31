require 'spec_helper'

describe "works/edit.html.haml" do
  before(:each) do
    @work = assign(:work, stub_model(Work,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit work form" do
    render

    rendered.should have_selector("form", :action => work_path(@work), :method => "post") do |form|
      form.should have_selector("input#work_name", :name => "work[name]")
    end
  end
end
