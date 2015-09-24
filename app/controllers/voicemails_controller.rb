class VoicemailsController < ApplicationController
  before_action :set_voicemail, only: [:show, :edit, :update, :destroy]

  # GET /voicemails
  # GET /voicemails.json
  def index
    @voicemails = Voicemail.all
  end

  # GET /voicemails/1
  # GET /voicemails/1.json
  def show
  end

  # GET /voicemails/new
  def new
    @voicemail = Voicemail.new
  end

  # GET /voicemails/1/edit
  def edit
  end

  # POST /voicemails
  # POST /voicemails.json
  def create
    @voicemail = Voicemail.new(voicemail_params)

    respond_to do |format|
      if @voicemail.save
        format.html { redirect_to @voicemail, notice: 'Voicemail was successfully created.' }
        format.json { render :show, status: :created, location: @voicemail }
      else
        format.html { render :new }
        format.json { render json: @voicemail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voicemails/1
  # PATCH/PUT /voicemails/1.json
  def update
    respond_to do |format|
      if @voicemail.update(voicemail_params)
        format.html { redirect_to @voicemail, notice: 'Voicemail was successfully updated.' }
        format.json { render :show, status: :ok, location: @voicemail }
      else
        format.html { render :edit }
        format.json { render json: @voicemail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voicemails/1
  # DELETE /voicemails/1.json
  def destroy
    @voicemail.destroy
    respond_to do |format|
      format.html { redirect_to voicemails_url, notice: 'Voicemail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voicemail
      @voicemail = Voicemail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voicemail_params
      params.require(:voicemail).permit(:audio, :connection_id, :created_at, :has_been_listened)
    end
end
