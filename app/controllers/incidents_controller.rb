class IncidentsController < ApplicationController
	before_action :get_school

  def new  	
  	@incident = @school.incidents.build(is_quick: false, is_anonymous: false)
  	@incident_proof = @incident.incident_proofs.build
  end

  def create
  	@incident = @school.incidents.build(incident_params)
  	if @incident.save
  		unless params[:incident_proofs].nil?
	  		params[:incident_proofs]['avatar'].each do |a|
	        @incident_proof = @incident.incident_proofs.create!(:avatar => a, :incident_id => @incident.id)       
	      end
	    end

  		flash[:success] = "Thank you for Reporting the incident. We appreciate your contribution to the society"
  		redirect_to root_path
  	else
  		@incident_proof = @incident.incident_proofs.build
  		flash.now[:error] = @incident.errors.full_messages.join(", ")
  		if @incident.is_quick
  			render 'quick_report'
			else
				render 'new'
			end
  	end
  end

  def index
  	redirect_to root_path  	
  end

  def quick_report
  	@incident = @school.incidents.build(is_quick: true, is_anonymous: true)
  	@incident_proof = @incident.incident_proofs.build
  end

  private

  def get_school
  	@school = School.find(1)
  end

  def incident_params
  	params.require(:incident).permit( :description, {incident_type: []}, :reportee_name, 
  															:reportee_email, :reportee_phone, :reportee_role, :defaulter_details, 
  															:witness_details, :incident_time, :location, :is_anonymous, :is_quick, 
  															incident_proofs_attributes: [:id, :incident_id, :avatar])
  end
end
