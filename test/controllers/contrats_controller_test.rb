require "test_helper"

class ContratsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contrat = contrats(:one)
  end

  test "should get index" do
    get contrats_url
    assert_response :success
  end

  test "should get new" do
    get new_contrat_url
    assert_response :success
  end

  test "should create contrat" do
    assert_difference("Contrat.count") do
      post contrats_url, params: { contrat: { information_id: @contrat.information_id, name_contrat: @contrat.name_contrat } }
    end

    assert_redirected_to contrat_url(Contrat.last)
  end

  test "should show contrat" do
    get contrat_url(@contrat)
    assert_response :success
  end

  test "should get edit" do
    get edit_contrat_url(@contrat)
    assert_response :success
  end

  test "should update contrat" do
    patch contrat_url(@contrat), params: { contrat: { information_id: @contrat.information_id, name_contrat: @contrat.name_contrat } }
    assert_redirected_to contrat_url(@contrat)
  end

  test "should destroy contrat" do
    assert_difference("Contrat.count", -1) do
      delete contrat_url(@contrat)
    end

    assert_redirected_to contrats_url
  end
end
