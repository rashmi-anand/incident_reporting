require 'rails_helper'

RSpec.describe IncidentsController, type: :controller do

  describe "GET #quick report" do
	  it "assigns is_quick to true to the new incident" do
	    get :quick_report
	    assigns(:incident).is_quick.should eq true
	  end

	  it "should render a quick report template" do
	  	get :quick_report
	  	response.should render_template :quick_report
	  end
	end

  describe "GET #new incident" do
	  it "assigns is_quick to false to the new incident" do
	    get :new
	    assigns(:incident).is_quick.should eq false
	  end

	  it "should render a new template" do
	  	get :new
	  	response.should render_template :new
	  end
	end

	describe "POST create" do
		context "with valid attributes" do
	    it "creates a new incident" do
	    	incident_params = FactoryGirl.attributes_for(:incident)
	    	expect { post(:create, params: { incident: incident_params }) }.to change(Incident, :count).by(1)
	    	expect(flash[:success]).to eq "Thank you for Reporting the incident. We appreciate your contribution to the society"
	    end
	    
	    it "redirects to the new incident" do
	    	incident_params = FactoryGirl.attributes_for(:incident)
	    	post(:create, params: { incident: incident_params })
	      response.should redirect_to root_path
	    end
	  end

	  context "with invalid attributes" do
	    it "does not save the new quick incident" do
	    	incident_params = FactoryGirl.attributes_for(:incident)
	    	incident_params[:description] = nil
	    	expect { post(:create, params: { incident: incident_params }) }.to_not change(Incident, :count)
	    end
	    
	    it "does not save the new quick incident and redirect to the quick report" do
	    	incident_params = FactoryGirl.attributes_for(:incident)
	    	incident_params[:description] = nil
	    	post(:create, params: { incident: incident_params })
	      response.should render_template :quick_report
	    end

	    it "does not save the new detailed incident and redirect to the new incident" do
	    	incident_params = FactoryGirl.attributes_for(:incident)
	    	incident_params[:is_quick] = false
	    	incident_params[:description] = nil
	    	post(:create, params: { incident: incident_params })
	      response.should render_template :new
	    end
	  end 
	end

end
