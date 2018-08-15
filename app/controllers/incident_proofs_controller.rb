class IncidentProofsController < ApplicationController
  before_action :set_incident_proof, only: [:show, :edit, :update, :destroy]

  # GET /incident_proofs
  # GET /incident_proofs.json
  def index
    @incident_proofs = IncidentProof.all
  end

  # GET /incident_proofs/1
  # GET /incident_proofs/1.json
  def show
  end

  # GET /incident_proofs/new
  def new
    @incident_proof = IncidentProof.new
  end

  # GET /incident_proofs/1/edit
  def edit
  end

  # POST /incident_proofs
  # POST /incident_proofs.json
  def create
    @incident_proof = IncidentProof.new(incident_proof_params)

    respond_to do |format|
      if @incident_proof.save
        format.html { redirect_to @incident_proof, notice: 'Incident proof was successfully created.' }
        format.json { render :show, status: :created, location: @incident_proof }
      else
        format.html { render :new }
        format.json { render json: @incident_proof.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incident_proofs/1
  # PATCH/PUT /incident_proofs/1.json
  def update
    respond_to do |format|
      if @incident_proof.update(incident_proof_params)
        format.html { redirect_to @incident_proof, notice: 'Incident proof was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident_proof }
      else
        format.html { render :edit }
        format.json { render json: @incident_proof.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_proofs/1
  # DELETE /incident_proofs/1.json
  def destroy
    @incident_proof.destroy
    respond_to do |format|
      format.html { redirect_to incident_proofs_url, notice: 'Incident proof was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident_proof
      @incident_proof = IncidentProof.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_proof_params
      params.require(:incident_proof).permit(:incident_id, :avatar)
    end
end
