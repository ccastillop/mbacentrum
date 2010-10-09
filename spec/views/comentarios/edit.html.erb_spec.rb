require 'spec_helper'

describe "comentarios/edit.html.erb" do
  before(:each) do
    @comentario = assign(:comentario, stub_model(Comentario,
      :new_record? => false,
      :texto => "MyString",
      :user_id => 1,
      :comentable_type => "MyString",
      :comentable_id => 1
    ))
  end

  it "renders the edit comentario form" do
    render

    rendered.should have_selector("form", :action => comentario_path(@comentario), :method => "post") do |form|
      form.should have_selector("input#comentario_texto", :name => "comentario[texto]")
      form.should have_selector("input#comentario_user_id", :name => "comentario[user_id]")
      form.should have_selector("input#comentario_comentable_type", :name => "comentario[comentable_type]")
      form.should have_selector("input#comentario_comentable_id", :name => "comentario[comentable_id]")
    end
  end
end
