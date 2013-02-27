class User < ActiveRecord::Base
  resourcify
  rolify
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :confirmed_at
  attr_accessible :first_name, :last_name

  validates :email, :presence => true, :uniqueness => true, :format => { :with => /[a-zA-Z0-9._%+-]+\@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}/ }
  validates :password, :presence => true, :length => { :minimum => 6 }, :on => :create
  validates :password, :allow_blank => true, :length => { :minimum => 6 }, :on => :update
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  # Aktywacja użytkownika
  # user = User.find(1); user.confirm!
  # lub
  # user.skip_confirmation! przy user.create
  
  # Potwierdzenia mailowe nie wykorzystywane
  def confirmation_required?
    false
  end

  # Można aktywować?
  def active_for_authentication?
    confirmed? || confirmation_period_valid?
  end

  # Dezaktywacja użytkownika
  def unconfirm!
    self.confirmed_at = nil
  end
  
  def full_name
    "#{last_name} #{first_name}"
  end
end
