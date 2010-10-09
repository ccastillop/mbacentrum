require 'spec_helper'

describe "comentarios/show.html.erb" do
  before(:each) do
    @comentario = assign(:comentario, stub_model(Comentario,
      :texto => "Texto",
      :user_id => 1,
      :comentable_type => "Comentable Type",
      :comentable_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Texto".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Comentable Type".to_s)
    rendered.should contain(1.to_s)
  end
end
