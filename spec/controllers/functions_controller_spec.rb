require 'spec_helper'

describe FunctionsController do

  def mock_function(stubs={})
    @mock_function ||= mock_model(Function, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all functions as @functions" do
      Function.stub(:all) { [mock_function] }
      get :index
      assigns(:functions).should eq([mock_function])
    end
  end

  describe "GET show" do
    it "assigns the requested function as @function" do
      Function.stub(:find).with("37") { mock_function }
      get :show, :id => "37"
      assigns(:function).should be(mock_function)
    end
  end

  describe "GET new" do
    it "assigns a new function as @function" do
      Function.stub(:new) { mock_function }
      get :new
      assigns(:function).should be(mock_function)
    end
  end

  describe "GET edit" do
    it "assigns the requested function as @function" do
      Function.stub(:find).with("37") { mock_function }
      get :edit, :id => "37"
      assigns(:function).should be(mock_function)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created function as @function" do
        Function.stub(:new).with({'these' => 'params'}) { mock_function(:save => true) }
        post :create, :function => {'these' => 'params'}
        assigns(:function).should be(mock_function)
      end

      it "redirects to the created function" do
        Function.stub(:new) { mock_function(:save => true) }
        post :create, :function => {}
        response.should redirect_to(function_url(mock_function))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved function as @function" do
        Function.stub(:new).with({'these' => 'params'}) { mock_function(:save => false) }
        post :create, :function => {'these' => 'params'}
        assigns(:function).should be(mock_function)
      end

      it "re-renders the 'new' template" do
        Function.stub(:new) { mock_function(:save => false) }
        post :create, :function => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested function" do
        Function.should_receive(:find).with("37") { mock_function }
        mock_function.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :function => {'these' => 'params'}
      end

      it "assigns the requested function as @function" do
        Function.stub(:find) { mock_function(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:function).should be(mock_function)
      end

      it "redirects to the function" do
        Function.stub(:find) { mock_function(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(function_url(mock_function))
      end
    end

    describe "with invalid params" do
      it "assigns the function as @function" do
        Function.stub(:find) { mock_function(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:function).should be(mock_function)
      end

      it "re-renders the 'edit' template" do
        Function.stub(:find) { mock_function(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested function" do
      Function.should_receive(:find).with("37") { mock_function }
      mock_function.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the functions list" do
      Function.stub(:find) { mock_function }
      delete :destroy, :id => "1"
      response.should redirect_to(functions_url)
    end
  end

end
