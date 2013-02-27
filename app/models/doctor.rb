class Doctor < User
  has_many :clinic_doctors
  has_many :clinics, :through => :clinic_doctors
  
  attr_accessible :pzw

  validates :pzw,	:presence => true, :uniqueness => true, :format => { :with => /\d{7}/ }
  
  def summary
    "#{self.first_name} #{self.last_name}"
  end
end
