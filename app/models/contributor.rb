class Contributor < ActiveRecord::Base

  belongs_to :contributor

  has_many :observations
  has_many :corals
  has_many :traits
  has_many :resources
  has_many :standards
  has_many :contributors  

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :short_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def Contributor.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Contributor.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Contributor.encrypt(Contributor.new_remember_token)
    end

end
