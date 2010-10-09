require 'spec_helper'

describe "comentarios/index.html.erb" do
  before(:each) do
    assign(:comentarios, [
      stub_model(Comentario,
        :texto => "Texto",
        :user_id => 1,
        :comentable_type => "Comentable Type",
        :comentable_id => 1
      ),
      stub_model(Comentario,
        :texto => "Texto",
        :user_id => 1,
        :comentable_type => "Comentable Type",
        :comentable_id => 1
      )
    ])
  end

  it "renders a list of comentarios" do
    render
    rendered.should have_selector("tr>td", :content => "Texto".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Comentable Type".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
