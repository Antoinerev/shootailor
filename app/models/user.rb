class User < ActiveRecord::Base
  has_many :demands, class_name: 'Booking', foreign_key: 'client_id'
  has_many :shootings, class_name: 'Booking', foreign_key: 'photog_id'
end
