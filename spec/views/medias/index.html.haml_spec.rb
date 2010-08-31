require 'spec_helper'

describe "medias/index.html.haml" do
  before(:each) do
    assign(:medias, [
      stub_model(Media,
        :nombre => "Nombre",
        :descripcion => "MyText",
        :archivo_file_name => "Archivo File Name",
        :archivo_content_type => "Archivo Content Type",
        :archivo_file_size => 1
      ),
      stub_model(Media,
        :nombre => "Nombre",
        :descripcion => "MyText",
        :archivo_file_name => "Archivo File Name",
        :archivo_content_type => "Archivo Content Type",
        :archivo_file_size => 1
      )
    ])
  end

  it "renders a list of medias" do
    render
    rendered.should have_selector("tr>td", :content => "Nombre".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Archivo File Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Archivo Content Type".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
