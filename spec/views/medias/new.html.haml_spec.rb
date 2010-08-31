require 'spec_helper'

describe "medias/new.html.haml" do
  before(:each) do
    assign(:media, stub_model(Media,
      :new_record? => true,
      :nombre => "MyString",
      :descripcion => "MyText",
      :archivo_file_name => "MyString",
      :archivo_content_type => "MyString",
      :archivo_file_size => 1
    ))
  end

  it "renders new media form" do
    render

    rendered.should have_selector("form", :action => medias_path, :method => "post") do |form|
      form.should have_selector("input#media_nombre", :name => "media[nombre]")
      form.should have_selector("textarea#media_descripcion", :name => "media[descripcion]")
      form.should have_selector("input#media_archivo_file_name", :name => "media[archivo_file_name]")
      form.should have_selector("input#media_archivo_content_type", :name => "media[archivo_content_type]")
      form.should have_selector("input#media_archivo_file_size", :name => "media[archivo_file_size]")
    end
  end
end
