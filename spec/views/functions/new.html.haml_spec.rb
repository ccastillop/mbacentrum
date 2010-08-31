require 'spec_helper'

describe "functions/new.html.haml" do
  before(:each) do
    assign(:function, stub_model(Function,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new function form" do
    render

    rendered.should have_selector("form", :action => functions_path, :method => "post") do |form|
      form.should have_selector("input#function_name", :name => "function[name]")
    end
  end
end
