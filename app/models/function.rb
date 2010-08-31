class Function < ActiveRecord::Base
  has_many :profiles
  has_paper_trail
  def to_s
    name
  end
end
