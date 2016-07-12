class User < ActiveRecord::Base
  has_many :demands, class_name: 'Booking', foreign_key: 'client_id'
  has_many :shootings, class_name: 'Booking', foreign_key: 'photog_id'

  has_attachments :photos, maximum: 6

# Include default devise modules. Others available are:
 # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
end
