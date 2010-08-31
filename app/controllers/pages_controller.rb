class PagesController < ApplicationController

  def about
  end
  
  #Muestro toda la actividad del sitio
  def activity
    @activities = Version.all(:limit => 20)
  end
  
end
