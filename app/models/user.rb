class User < ActiveRecord::Base
  has_many :demands, class_name: 'Booking', foreign_key: 'client_id'
  has_many :shootings, class_name: 'Booking', foreign_key: 'photog_id'

  has_attachments :portfolios, maximum: 6

  # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  def self.find_for_facebook_oauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.picture = auth.info.image
        user.token = auth.credentials.token
        user.token_expiry = Time.at(auth.credentials.expires_at)
      end
  end

  def profile_pict
    self.avatar = nil if self.avatar ==""
    default_pict = "http://res.cloudinary.com/dujnmeiiu/image/upload/v1468402123/empty-avatar_qeezog.jpg"
    self.avatar || self.picture || default_pict
  end

  def photog_card_background
    default_card_bg = "http://res.cloudinary.com/dujnmeiiu/image/upload/v1468421263/11600983135_05ea939613_o_uxwrv2.jpg"
    self.portfolios.first ? self.portfolios.first.path : default_card_bg
  end

end
