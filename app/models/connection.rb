class Connection < ActiveRecord::Base
  has_one :voicemail
  enum state: [:pending, :talking, :recording, :closed]
end
