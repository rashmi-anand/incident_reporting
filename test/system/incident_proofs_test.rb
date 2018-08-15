require "application_system_test_case"

class IncidentProofsTest < ApplicationSystemTestCase
  setup do
    @incident_proof = incident_proofs(:one)
  end

  test "visiting the index" do
    visit incident_proofs_url
    assert_selector "h1", text: "Incident Proofs"
  end

  test "creating a Incident proof" do
    visit incident_proofs_url
    click_on "New Incident Proof"

    fill_in "Avatar", with: @incident_proof.avatar
    fill_in "Incident", with: @incident_proof.incident_id
    click_on "Create Incident proof"

    assert_text "Incident proof was successfully created"
    click_on "Back"
  end

  test "updating a Incident proof" do
    visit incident_proofs_url
    click_on "Edit", match: :first

    fill_in "Avatar", with: @incident_proof.avatar
    fill_in "Incident", with: @incident_proof.incident_id
    click_on "Update Incident proof"

    assert_text "Incident proof was successfully updated"
    click_on "Back"
  end

  test "destroying a Incident proof" do
    visit incident_proofs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Incident proof was successfully destroyed"
  end
end
