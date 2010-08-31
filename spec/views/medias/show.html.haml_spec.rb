require 'spec_helper'

describe "medias/show.html.haml" do
  before(:each) do
    @media = assign(:media, stub_model(Media,
      :nombre => "Nombre",
      :descripcion => "MyText",
      :archivo_file_name => "Archivo File Name",
      :archivo_content_type => "Archivo Content Type",
      :archivo_file_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Nombre".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain("Archivo File Name".to_s)
    rendered.should contain("Archivo Content Type".to_s)
    rendered.should contain(1.to_s)
  end
end
