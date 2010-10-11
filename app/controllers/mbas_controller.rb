class MbasController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /mbas
  # GET /mbas.xml
  def index
    @mbas = Mba.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mbas }
    end
  end

  # GET /mbas/1
  # GET /mbas/1.xml
  def show
    @mba = Mba.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mba }
    end
  end

  # GET /mbas/new
  # GET /mbas/new.xml
  def new
    @mba = Mba.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mba }
    end
  end

  # GET /mbas/1/edit
  def edit
    @mba = Mba.find(params[:id])
  end

  # POST /mbas
  # POST /mbas.xml
  def create
    @mba = Mba.new(params[:mba])

    respond_to do |format|
      if @mba.save
        format.html { redirect_to(@mba, :notice => 'Mba ha sido creado.') }
        format.xml  { render :xml => @mba, :status => :created, :location => @mba }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mba.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mbas/1
  # PUT /mbas/1.xml
  def update
    @mba = Mba.find(params[:id])

    respond_to do |format|
      if @mba.update_attributes(params[:mba])
        format.html { redirect_to(@mba, :notice => 'Mba ha sido modificado.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mba.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mbas/1
  # DELETE /mbas/1.xml
  def destroy
    @mba = Mba.find(params[:id])
    @mba.destroy

    respond_to do |format|
      format.html { redirect_to(mbas_url) }
      format.xml  { head :ok }
    end
  end
end
