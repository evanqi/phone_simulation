class ConnectionsController < ApplicationController
  before_action :set_connection,
    only: [:show,
           :edit,
           :update,
           :destroy,
           :return_greeting,
           :send_voicemail,
           :send_digit]

  # GET /connections
  # GET /connections.json
  def index
    @connections = Connection.all
  end

  # GET /connections/1
  # GET /connections/1.json
  def show
  end

  # GET /connections/new
  def new
    @connection = Connection.new
  end

  # GET /connections/1/edit
  def edit
  end

  # POST /connections
  # POST /connections.json
  def create
    @connection = Connection.new(connection_params)
    @connection.state = :ringing
    Log.create(:description => "Incoming connection received")

    respond_to do |format|
      if @connection.save
        format.html { redirect_to root_path, notice: 'Connection was successfully created.' }
        format.json { render :show, status: :created, location: @connection }
      else
        format.html { render :new }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connections/1
  # PATCH/PUT /connections/1.json
  def update
    respond_to do |format|
      if @connection.state != connection_params["state"]
        Log.create(:description => "Connection state changed from " + @connection.state + " to " + connection_params["state"])
      end
      if @connection.update(connection_params)
        format.html { redirect_to root_path, notice: 'Connection was successfully updated.' }
        format.json { render :show, status: :ok, location: @connection }
      else
        format.html { render :edit }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connections/1
  # DELETE /connections/1.json
  def destroy
    @connection.destroy
    respond_to do |format|
      format.html { redirect_to connections_url, notice: 'Connection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /connections/1/return_greeting
  # For answering machine to tell the system that it should stop
  # ringing and return a voicemail greeting
  def return_greeting
    @connection.update_attribute(:state, :recording)
    # Pass greeting back to external phone
    #
    redirect_to root_path
  end

  # POST /connections/1/leave_voicemail
  # For external phone to leave a voicemail
  def leave_voicemail
    logger.info "Sending voicemail #{params[:voicemail]}"
    # Store voicemail for this connection
    #
    redirect_to root_path
  end

  # POST /connections/1/send_digit
  # For external phone to send a digit
  def send_digit
    logger.info "Sending digit #{params[:digit]}"
    # Pass the digit to all answering machines
    #
    Log.create(:description => "Sending digit: #{params[:digit]}")
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connection
      @connection = Connection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connection_params
      params.require(:connection).permit(:state, :incoming_url, :incoming_phone_num, :incoming_caller_id)
    end
end
