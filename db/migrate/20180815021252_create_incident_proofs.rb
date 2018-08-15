class CreateIncidentProofs < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_proofs do |t|
      t.integer :incident_id
      t.string :avatar

      t.timestamps
    end
  end
end
