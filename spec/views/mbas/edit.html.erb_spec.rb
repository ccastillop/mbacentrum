require 'spec_helper'

describe "mbas/edit.html.erb" do
  before(:each) do
    @mba = assign(:mba, stub_model(Mba,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit mba form" do
    render

    rendered.should have_selector("form", :action => mba_path(@mba), :method => "post") do |form|
      form.should have_selector("input#mba_name", :name => "mba[name]")
    end
  end
end
