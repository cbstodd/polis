class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  #validates :name, presence: true or
  # validates_presence_of :name not needed with length_of.
  validates_length_of :username, maximum: 50, minimum: 3
  validates_uniqueness_of :username


  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255, minimum: 5 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
