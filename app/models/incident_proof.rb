class IncidentProof < ApplicationRecord
	belongs_to :incident
	mount_uploader :avatar, AvatarUploader
end
