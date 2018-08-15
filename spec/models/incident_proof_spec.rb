require 'rails_helper'

RSpec.describe IncidentProof, type: :model do
  it { should belong_to :incident }
end
