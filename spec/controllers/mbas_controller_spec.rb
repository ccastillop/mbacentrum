require 'spec_helper'

describe MbasController do

  def mock_mba(stubs={})
    @mock_mba ||= mock_model(Mba, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all mbas as @mbas" do
      Mba.stub(:all) { [mock_mba] }
      get :index
      assigns(:mbas).should eq([mock_mba])
    end
  end

  describe "GET show" do
    it "assigns the requested mba as @mba" do
      Mba.stub(:find).with("37") { mock_mba }
      get :show, :id => "37"
      assigns(:mba).should be(mock_mba)
    end
  end

  describe "GET new" do
    it "assigns a new mba as @mba" do
      Mba.stub(:new) { mock_mba }
      get :new
      assigns(:mba).should be(mock_mba)
    end
  end

  describe "GET edit" do
    it "assigns the requested mba as @mba" do
      Mba.stub(:find).with("37") { mock_mba }
      get :edit, :id => "37"
      assigns(:mba).should be(mock_mba)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created mba as @mba" do
        Mba.stub(:new).with({'these' => 'params'}) { mock_mba(:save => true) }
        post :create, :mba => {'these' => 'params'}
        assigns(:mba).should be(mock_mba)
      end

      it "redirects to the created mba" do
        Mba.stub(:new) { mock_mba(:save => true) }
        post :create, :mba => {}
        response.should redirect_to(mba_url(mock_mba))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mba as @mba" do
        Mba.stub(:new).with({'these' => 'params'}) { mock_mba(:save => false) }
        post :create, :mba => {'these' => 'params'}
        assigns(:mba).should be(mock_mba)
      end

      it "re-renders the 'new' template" do
        Mba.stub(:new) { mock_mba(:save => false) }
        post :create, :mba => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested mba" do
        Mba.should_receive(:find).with("37") { mock_mba }
        mock_mba.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :mba => {'these' => 'params'}
      end

      it "assigns the requested mba as @mba" do
        Mba.stub(:find) { mock_mba(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:mba).should be(mock_mba)
      end

      it "redirects to the mba" do
        Mba.stub(:find) { mock_mba(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(mba_url(mock_mba))
      end
    end

    describe "with invalid params" do
      it "assigns the mba as @mba" do
        Mba.stub(:find) { mock_mba(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:mba).should be(mock_mba)
      end

      it "re-renders the 'edit' template" do
        Mba.stub(:find) { mock_mba(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested mba" do
      Mba.should_receive(:find).with("37") { mock_mba }
      mock_mba.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the mbas list" do
      Mba.stub(:find) { mock_mba }
      delete :destroy, :id => "1"
      response.should redirect_to(mbas_url)
    end
  end

end
