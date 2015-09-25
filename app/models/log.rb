class Log < ActiveRecord::Base
  def self.get_last_ten_logs
    @logs = Log.order('logs.created_at DESC').limit(10).load
  end
end
