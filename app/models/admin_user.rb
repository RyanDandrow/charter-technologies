
$USER_ACCESS_LEVEL_ADMIN = 0
$USER_ACCESS_LEVEL_USER = 10

class AdminUser < ActiveRecord::Base

  has_many :comments, through: :contacts

  acts_as_authentic do |c|
      c.validate_email_field = true
      c.transition_from_crypto_providers = [Authlogic::CryptoProviders::Sha512]
      c.crypto_provider = Authlogic::CryptoProviders::SCrypt
      c.logged_in_timeout = 59.minutes
  end

  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  

	def self.has_more_than_one_admin
    AdminUser.where(:access_level => $USER_ACCESS_LEVEL_ADMIN).count > 1
  end


	def is_admin?
	  access_level == $USER_ACCESS_LEVEL_ADMIN
	end

end

