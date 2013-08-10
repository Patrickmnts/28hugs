class Subscriber < ActiveRecord::Base

	has_secure_password
  has_many :charges

  def self.daily_charge_list
   Subscriber.where(ship_date: Date.today)
  end

  def self.payment_status_updater

    subscriber.update(payment_status) << subscriber.charges.last.paid_status
  end

  validates :password, length: { minimum: 6 }
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :first_name && :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  def Subscriber.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Subscriber.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Subscriber.encrypt(Subscriber.new_remember_token)
    end
end
