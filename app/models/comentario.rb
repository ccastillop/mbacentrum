class Comentario < ActiveRecord::Base
  belongs_to :comentable, :polymorphic => true
  belongs_to :user
  has_paper_trail
  validates_presence_of :texto
  # Setup accessible (or protected) attributes for your model
  attr_accessible :texto
end
