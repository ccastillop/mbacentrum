class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => :about
  def about
  end
  
  #Muestro toda la actividad del sitio
  def activity
    @activities = Version.where("whodunnit<>'0' and event <> 'destroy'").limit(20).order("created_at desc")
  end
  
end
