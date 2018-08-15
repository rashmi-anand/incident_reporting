class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.references :school, foreign_key: true
      t.text :description
      t.text :incident_type
      t.string :reportee_name
      t.string :reportee_email
      t.string :reportee_phone
      t.string :reportee_role
      t.text :defaulter_details
      t.text :witness_details
      t.datetime :incident_time
      t.text :location
      t.boolean :is_anonymous
      t.boolean :is_quick

      t.timestamps
    end
  end
end
