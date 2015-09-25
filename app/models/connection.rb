class Connection < ActiveRecord::Base
  has_one :voicemail
  enum state: [:ringing, :recording, :closed]
end
