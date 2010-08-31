require "spec_helper"

describe FunctionsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/functions" }.should route_to(:controller => "functions", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/functions/new" }.should route_to(:controller => "functions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/functions/1" }.should route_to(:controller => "functions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/functions/1/edit" }.should route_to(:controller => "functions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/functions" }.should route_to(:controller => "functions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/functions/1" }.should route_to(:controller => "functions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/functions/1" }.should route_to(:controller => "functions", :action => "destroy", :id => "1")
    end

  end
end
