class PagesController < ApplicationController
  def index
    @con = Connection.last
    if(@con.state == "closed")
     @con = nil         
     end
  end
end
