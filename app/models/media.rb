class Media < ActiveRecord::Base
  belongs_to :user
  has_paper_trail
  has_attached_file :archivo, :styles => {:grande => "900x900>",:normal => "620x620>" ,:medium => "340x340>",:short => "140x140>", :thumb => "60x60>" }
  TIPOS = [ "Perfil", "Documento", "Video"]

  def to_s
    "Archivo"
  end

end
