class PagesController < ApplicationController
  def index
    @con = Connection.last
    if(!@con.nil? && @con.state == "closed")
      @con = nil
    end
    @logs = Log.get_last_ten_logs
  end
end
