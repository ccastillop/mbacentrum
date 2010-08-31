require "spec_helper"

describe MbasController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/mbas" }.should route_to(:controller => "mbas", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/mbas/new" }.should route_to(:controller => "mbas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/mbas/1" }.should route_to(:controller => "mbas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/mbas/1/edit" }.should route_to(:controller => "mbas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/mbas" }.should route_to(:controller => "mbas", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/mbas/1" }.should route_to(:controller => "mbas", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/mbas/1" }.should route_to(:controller => "mbas", :action => "destroy", :id => "1")
    end

  end
end
