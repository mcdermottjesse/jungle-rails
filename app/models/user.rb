class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :password, presence: true
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true
   
  before_save do
    self.email.downcase!
  end
  
  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
