class Patient < User
  has_many :appointments
  
  attr_accessible :pesel, :address, :postal_code, :city

  validates :pesel, :presence => true, :uniqueness => true, :format => { :with => /\d{11}/ }
  validates :address, :presence => true
  validates :postal_code, :presence => true, :format => { :with => /\d{2}\-\d{3}/ }
  validates :city, :presence => true
end
