require 'test_helper'

class IncidentProofsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incident_proof = incident_proofs(:one)
  end

  test "should get index" do
    get incident_proofs_url
    assert_response :success
  end

  test "should get new" do
    get new_incident_proof_url
    assert_response :success
  end

  test "should create incident_proof" do
    assert_difference('IncidentProof.count') do
      post incident_proofs_url, params: { incident_proof: { avatar: @incident_proof.avatar, incident_id: @incident_proof.incident_id } }
    end

    assert_redirected_to incident_proof_url(IncidentProof.last)
  end

  test "should show incident_proof" do
    get incident_proof_url(@incident_proof)
    assert_response :success
  end

  test "should get edit" do
    get edit_incident_proof_url(@incident_proof)
    assert_response :success
  end

  test "should update incident_proof" do
    patch incident_proof_url(@incident_proof), params: { incident_proof: { avatar: @incident_proof.avatar, incident_id: @incident_proof.incident_id } }
    assert_redirected_to incident_proof_url(@incident_proof)
  end

  test "should destroy incident_proof" do
    assert_difference('IncidentProof.count', -1) do
      delete incident_proof_url(@incident_proof)
    end

    assert_redirected_to incident_proofs_url
  end
end
