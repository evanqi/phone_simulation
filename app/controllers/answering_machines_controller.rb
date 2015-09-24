class AnsweringMachinesController < ApplicationController
  before_action :set_answering_machine, only: [:show, :edit, :update, :destroy]

  # GET /answering_machines
  # GET /answering_machines.json
  def index
    @answering_machines = AnsweringMachine.all
  end

  # GET /answering_machines/1
  # GET /answering_machines/1.json
  def show
  end

  # GET /answering_machines/new
  def new
    @answering_machine = AnsweringMachine.new
  end

  # GET /answering_machines/1/edit
  def edit
  end

  # POST /answering_machines
  # POST /answering_machines.json
  def create
    @answering_machine = AnsweringMachine.new(answering_machine_params)

    respond_to do |format|
      if @answering_machine.save
        format.html { redirect_to @answering_machine, notice: 'Answering machine was successfully created.' }
        format.json { render :show, status: :created, location: @answering_machine }
      else
        format.html { render :new }
        format.json { render json: @answering_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answering_machines/1
  # PATCH/PUT /answering_machines/1.json
  def update
    respond_to do |format|
      if @answering_machine.update(answering_machine_params)
        format.html { redirect_to @answering_machine, notice: 'Answering machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @answering_machine }
      else
        format.html { render :edit }
        format.json { render json: @answering_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answering_machines/1
  # DELETE /answering_machines/1.json
  def destroy
    @answering_machine.destroy
    respond_to do |format|
      format.html { redirect_to answering_machines_url, notice: 'Answering machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answering_machine
      @answering_machine = AnsweringMachine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answering_machine_params
      params.require(:answering_machine).permit(:url)
    end
end
