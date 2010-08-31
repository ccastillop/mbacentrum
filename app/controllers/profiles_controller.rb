class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :new_profile?, :only => [:new,:create]
  load_and_authorize_resource
  #before_filter :autorize, :except => [:index, :show, :create, :new]
  autocomplete :work, :name, :full => true

  # GET /profiles
  # GET /profiles.xml
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.xml
  def create
    work_name
    respond_to do |format|
      if @profile.save
        format.html { redirect_to(@profile, :notice => 'Profile ha sido creado.') }
        format.xml  { render :xml => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = Profile.find(params[:id])
    work_name
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile ha sido modificado.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    
    def work_name
      if params[:work_name]
        unless @profile.work and @profile.work.name == params[:work_name]
          w = Work.where(["name like ?", params[:work_name].strip]).first
          unless w
            w = Work.new(:name => params[:work_name].strip)
            w.save
          end
          @profile.work = w
        end
      end
    end
    
    #para cuando el usuario no tiene aun perfil
    def new_profile?
      @profile = Profile.new(params[:profile])
      @profile.user = current_user
      @profile.email = current_user.email
    end
end
