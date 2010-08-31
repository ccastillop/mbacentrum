require 'spec_helper'

describe "mbas/new.html.erb" do
  before(:each) do
    assign(:mba, stub_model(Mba,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new mba form" do
    render

    rendered.should have_selector("form", :action => mbas_path, :method => "post") do |form|
      form.should have_selector("input#mba_name", :name => "mba[name]")
    end
  end
end
