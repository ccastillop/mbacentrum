require 'spec_helper'

describe "profiles/index.html.haml" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => "Gender",
        :email => "Email",
        :about => "About",
        :mba_id => 1,
        :work_id => 1,
        :funcional_id => 1,
        :level_id => 1
      ),
      stub_model(Profile,
        :first_name => "First Name",
        :last_name => "Last Name",
        :gender => "Gender",
        :email => "Email",
        :about => "About",
        :mba_id => 1,
        :work_id => 1,
        :funcional_id => 1,
        :level_id => 1
      )
    ])
  end

  it "renders a list of profiles" do
    render
    rendered.should have_selector("tr>td", :content => "First Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Last Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Gender".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Email".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "About".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
