require "spec_helper"

describe ComentariosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/comentarios" }.should route_to(:controller => "comentarios", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/comentarios/new" }.should route_to(:controller => "comentarios", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/comentarios/1" }.should route_to(:controller => "comentarios", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/comentarios/1/edit" }.should route_to(:controller => "comentarios", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/comentarios" }.should route_to(:controller => "comentarios", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/comentarios/1" }.should route_to(:controller => "comentarios", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/comentarios/1" }.should route_to(:controller => "comentarios", :action => "destroy", :id => "1")
    end

  end
end
