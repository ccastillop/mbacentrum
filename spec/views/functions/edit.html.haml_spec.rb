require 'spec_helper'

describe "functions/edit.html.haml" do
  before(:each) do
    @function = assign(:function, stub_model(Function,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit function form" do
    render

    rendered.should have_selector("form", :action => function_path(@function), :method => "post") do |form|
      form.should have_selector("input#function_name", :name => "function[name]")
    end
  end
end
