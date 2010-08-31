require 'spec_helper'

describe "profiles/edit.html.haml" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :new_record? => false,
      :first_name => "MyString",
      :last_name => "MyString",
      :gender => "MyString",
      :email => "MyString",
      :about => "MyString",
      :mba_id => 1,
      :work_id => 1,
      :funcional_id => 1,
      :level_id => 1
    ))
  end

  it "renders the edit profile form" do
    render

    rendered.should have_selector("form", :action => profile_path(@profile), :method => "post") do |form|
      form.should have_selector("input#profile_first_name", :name => "profile[first_name]")
      form.should have_selector("input#profile_last_name", :name => "profile[last_name]")
      form.should have_selector("input#profile_gender", :name => "profile[gender]")
      form.should have_selector("input#profile_email", :name => "profile[email]")
      form.should have_selector("input#profile_about", :name => "profile[about]")
      form.should have_selector("input#profile_mba_id", :name => "profile[mba_id]")
      form.should have_selector("input#profile_work_id", :name => "profile[work_id]")
      form.should have_selector("input#profile_funcional_id", :name => "profile[funcional_id]")
      form.should have_selector("input#profile_level_id", :name => "profile[level_id]")
    end
  end
end
