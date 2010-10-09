require 'spec_helper'

describe ComentariosController do

  def mock_comentario(stubs={})
    @mock_comentario ||= mock_model(Comentario, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all comentarios as @comentarios" do
      Comentario.stub(:all) { [mock_comentario] }
      get :index
      assigns(:comentarios).should eq([mock_comentario])
    end
  end

  describe "GET show" do
    it "assigns the requested comentario as @comentario" do
      Comentario.stub(:find).with("37") { mock_comentario }
      get :show, :id => "37"
      assigns(:comentario).should be(mock_comentario)
    end
  end

  describe "GET new" do
    it "assigns a new comentario as @comentario" do
      Comentario.stub(:new) { mock_comentario }
      get :new
      assigns(:comentario).should be(mock_comentario)
    end
  end

  describe "GET edit" do
    it "assigns the requested comentario as @comentario" do
      Comentario.stub(:find).with("37") { mock_comentario }
      get :edit, :id => "37"
      assigns(:comentario).should be(mock_comentario)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created comentario as @comentario" do
        Comentario.stub(:new).with({'these' => 'params'}) { mock_comentario(:save => true) }
        post :create, :comentario => {'these' => 'params'}
        assigns(:comentario).should be(mock_comentario)
      end

      it "redirects to the created comentario" do
        Comentario.stub(:new) { mock_comentario(:save => true) }
        post :create, :comentario => {}
        response.should redirect_to(comentario_url(mock_comentario))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comentario as @comentario" do
        Comentario.stub(:new).with({'these' => 'params'}) { mock_comentario(:save => false) }
        post :create, :comentario => {'these' => 'params'}
        assigns(:comentario).should be(mock_comentario)
      end

      it "re-renders the 'new' template" do
        Comentario.stub(:new) { mock_comentario(:save => false) }
        post :create, :comentario => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested comentario" do
        Comentario.should_receive(:find).with("37") { mock_comentario }
        mock_comentario.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :comentario => {'these' => 'params'}
      end

      it "assigns the requested comentario as @comentario" do
        Comentario.stub(:find) { mock_comentario(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:comentario).should be(mock_comentario)
      end

      it "redirects to the comentario" do
        Comentario.stub(:find) { mock_comentario(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(comentario_url(mock_comentario))
      end
    end

    describe "with invalid params" do
      it "assigns the comentario as @comentario" do
        Comentario.stub(:find) { mock_comentario(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:comentario).should be(mock_comentario)
      end

      it "re-renders the 'edit' template" do
        Comentario.stub(:find) { mock_comentario(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested comentario" do
      Comentario.should_receive(:find).with("37") { mock_comentario }
      mock_comentario.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the comentarios list" do
      Comentario.stub(:find) { mock_comentario }
      delete :destroy, :id => "1"
      response.should redirect_to(comentarios_url)
    end
  end

end
