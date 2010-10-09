require 'spec_helper'

describe "comentarios/new.html.erb" do
  before(:each) do
    assign(:comentario, stub_model(Comentario,
      :new_record? => true,
      :texto => "MyString",
      :user_id => 1,
      :comentable_type => "MyString",
      :comentable_id => 1
    ))
  end

  it "renders new comentario form" do
    render

    rendered.should have_selector("form", :action => comentarios_path, :method => "post") do |form|
      form.should have_selector("input#comentario_texto", :name => "comentario[texto]")
      form.should have_selector("input#comentario_user_id", :name => "comentario[user_id]")
      form.should have_selector("input#comentario_comentable_type", :name => "comentario[comentable_type]")
      form.should have_selector("input#comentario_comentable_id", :name => "comentario[comentable_id]")
    end
  end
end
