class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => :about
  def about
  end
  
  #Muestro toda la actividad del sitio
  def activity
    @activities = Version.all(:limit => 20,:conditions => "whodunnit<>'0' and event <> 'destroy' and object is not null")
  end
  
end
