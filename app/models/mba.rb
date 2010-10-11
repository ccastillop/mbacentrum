class Mba < ActiveRecord::Base
  has_many :profiles
  has_paper_trail
  has_many :comentarios, :as=>:comentable
  def to_s
    name
  end
end
