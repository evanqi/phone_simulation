class Connection < ActiveRecord::Base
  enum state: [:pending, :talking, :recording, :closed]
end
