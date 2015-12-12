class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token
  before_save { self.email = email.downcase }
  before_create :create_activation_digest

  #validates :name, presence: true or
  # validates_presence_of :name not needed with length_of.
  validates_length_of :username, maximum: 50, minimum: 3
  validates_uniqueness_of :username


  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255, minimum: 5 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for the use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  #Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end


  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    #Creates and assigns activation token and digest.
    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end


end
