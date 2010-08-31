class Profile < ActiveRecord::Base
  belongs_to :function
  belongs_to :level
  belongs_to :mba
  belongs_to :work
  belongs_to :user
  before_save :email_default
  has_paper_trail

  validates_presence_of :first_name, :last_name, :level_id, :birthday, 
    :function_id, :mba_id, :gender, :work_id

  def to_s
    "#{first_name} #{last_name}"
  end
  


  private
    def email_default
      if self.email == nil || self.email.size < 5
        self.email = self.user.email
      end    
      logger.info "email = #{self.email}"
    end

end
