require 'spec_helper'

describe WorksController do

  def mock_work(stubs={})
    @mock_work ||= mock_model(Work, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all works as @works" do
      Work.stub(:all) { [mock_work] }
      get :index
      assigns(:works).should eq([mock_work])
    end
  end

  describe "GET show" do
    it "assigns the requested work as @work" do
      Work.stub(:find).with("37") { mock_work }
      get :show, :id => "37"
      assigns(:work).should be(mock_work)
    end
  end

  describe "GET new" do
    it "assigns a new work as @work" do
      Work.stub(:new) { mock_work }
      get :new
      assigns(:work).should be(mock_work)
    end
  end

  describe "GET edit" do
    it "assigns the requested work as @work" do
      Work.stub(:find).with("37") { mock_work }
      get :edit, :id => "37"
      assigns(:work).should be(mock_work)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created work as @work" do
        Work.stub(:new).with({'these' => 'params'}) { mock_work(:save => true) }
        post :create, :work => {'these' => 'params'}
        assigns(:work).should be(mock_work)
      end

      it "redirects to the created work" do
        Work.stub(:new) { mock_work(:save => true) }
        post :create, :work => {}
        response.should redirect_to(work_url(mock_work))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved work as @work" do
        Work.stub(:new).with({'these' => 'params'}) { mock_work(:save => false) }
        post :create, :work => {'these' => 'params'}
        assigns(:work).should be(mock_work)
      end

      it "re-renders the 'new' template" do
        Work.stub(:new) { mock_work(:save => false) }
        post :create, :work => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested work" do
        Work.should_receive(:find).with("37") { mock_work }
        mock_work.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :work => {'these' => 'params'}
      end

      it "assigns the requested work as @work" do
        Work.stub(:find) { mock_work(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:work).should be(mock_work)
      end

      it "redirects to the work" do
        Work.stub(:find) { mock_work(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(work_url(mock_work))
      end
    end

    describe "with invalid params" do
      it "assigns the work as @work" do
        Work.stub(:find) { mock_work(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:work).should be(mock_work)
      end

      it "re-renders the 'edit' template" do
        Work.stub(:find) { mock_work(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested work" do
      Work.should_receive(:find).with("37") { mock_work }
      mock_work.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the works list" do
      Work.stub(:find) { mock_work }
      delete :destroy, :id => "1"
      response.should redirect_to(works_url)
    end
  end

end
