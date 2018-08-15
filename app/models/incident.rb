class Incident < ApplicationRecord
  belongs_to :school
  has_many :incident_proofs
  
  accepts_nested_attributes_for :incident_proofs

  validates_presence_of :description
  validates :reportee_email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true, allow_nil: true

  before_save :update_reportee

  # Public: Will filter all the quick reports
  scope :quick_reports, -> { where(is_quick: true) }

  # Public: Will filter all the detailed reports
  scope :detailed_reports, -> { where(is_quick: false) }

  # Public: Array for all the incident types that can be recorded
  INCIDENT_TYPES = ['Alcohol', 
  									'Assault', 
  									'Bullying', 
  									'Hazing', 
  									'Drugs', 
  									'Graffiti', 
  									'Injury', 
  									'Suspicious activity', 
  									'Trespassing', 
  									'Vandalism', 
  									'Weapons violation',
  									'Technology misuse',
  									'Other']

  # Public: Array for possible locations of an incident
  INCIDENT_LOCATION = [ 'On school campuses and grounds',
  											'During transportation to and from school',
  											'At school-sponsored events',
  											'More details']

  # Public: Array of the reportee role
  REPORTEE_ROLE = [ 'Student',
  									'Teacher',
  									'Other Staff',
  									'Parent',
  									'Comunity Member']

  private

  # Private: Manage the anonymous reporting, 
  #					if user wants to report anonymously, his/her details will not get recorded
	# 				and if all his/her personal details are empty than he/she will be reporting as anonymously
	#
	# Returns the appropriate values for user's personal details and for its anonymity

  def update_reportee
  	if self.is_anonymous
  		self.reportee_email = nil 
  		self.reportee_name = nil 
  		self.reportee_phone = nil
  		self.reportee_role = nil
  	else
  		self.is_anonymous = true if self.reportee_email.blank? and self.reportee_name.blank? and self.reportee_phone.blank? and self.reportee_role.blank?
  	end
  end
end
