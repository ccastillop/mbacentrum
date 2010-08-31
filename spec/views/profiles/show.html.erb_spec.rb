require 'spec_helper'

describe "profiles/show.html.erb" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :first_name => "First Name",
      :last_name => "Last Name",
      :gender => "Gender",
      :email => "Email",
      :about => "About",
      :mba_id => 1,
      :work_id => 1,
      :funcional_id => 1,
      :level_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("First Name".to_s)
    rendered.should contain("Last Name".to_s)
    rendered.should contain("Gender".to_s)
    rendered.should contain("Email".to_s)
    rendered.should contain("About".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
