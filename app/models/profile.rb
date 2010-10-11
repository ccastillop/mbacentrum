class Profile < ActiveRecord::Base
  belongs_to :function
  belongs_to :level
  belongs_to :mba
  belongs_to :work
  belongs_to :user
  before_save :email_default
  has_many :comentarios, :as=>:comentable
  has_paper_trail
  belongs_to :retrato, :class_name => "Media", :foreign_key => "media_id"
  validate :has_only_one_profile?, :on => :create, :message => "Usted ya tiene un perfil, sólo puede crear uno."
  validates_presence_of :first_name, :last_name, :level_id, :birthday, 
    :function_id, :mba_id, :gender, :work_id

  def name
    "#{first_name} #{last_name}"
  end
  
  def to_s
    "#{name}"
  end

  private
    def email_default
      if self.email == nil || self.email.size < 5
        self.email = self.user.email
      end    
      logger.info "email = #{self.email}"
    end
    
    def has_only_one_profile?
      errors.add(:first_name, "Usted ya tiene un perfil, sólo puede crear uno.") if Profile.find_by_user_id(self.user.id)
    end

end
