class MediasController < ApplicationController
  before_filter :authenticate_user!
  before_filter :new_media?, :only => [:new,:create]
  load_and_authorize_resource
  # GET /medias
  # GET /medias.xml
  def index
    @medias = Media.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medias }
    end
  end

  # GET /medias/1
  # GET /medias/1.xml
  def show
    @media = Media.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @media }
    end
  end

  # GET /medias/new
  # GET /medias/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @media }
    end
  end

  # GET /medias/1/edit
  def edit
    @media = Media.find(params[:id])
  end

  # POST /medias
  # POST /medias.xml
  def create
    respond_to do |format|
      if @media.save
        format.html { redirect_to(@media, :notice => 'Media was successfully created.') }
        format.xml  { render :xml => @media, :status => :created, :location => @media }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @media.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medias/1
  # PUT /medias/1.xml
  def update
    @media = Media.find(params[:id])

    respond_to do |format|
      if @media.update_attributes(params[:media])
        format.html { redirect_to(@media, :notice => 'Media was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @media.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medias/1
  # DELETE /medias/1.xml
  def destroy
    @media = Media.find(params[:id])
    @media.destroy

    respond_to do |format|
      format.html { redirect_to(medias_url) }
      format.xml  { head :ok }
    end
  end
  
  def autocomplete_tipo
    r = []
    Media::TIPOS.each do |t|
      r << {"id" => t , "label" => t, "value" => t}
    end
    
    items = Media.select("DISTINCT(tipo)").order("tipo")
    r << ( items.collect {|i| {"id" => i["tipo"] , "label" => i["tipo"], "value" => i["tipo"]}})
    render :json => r
  end
  
  private
    #para cuando el usuario no tiene aun perfil
    def new_media?
      @media = Media.new(params[:media])
      @media.user = current_user
    end
end
