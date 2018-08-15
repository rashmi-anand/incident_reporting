class School < ApplicationRecord
	has_many :incidents
	validates :name, presence: true, uniqueness: true
end
