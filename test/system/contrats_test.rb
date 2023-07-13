require "application_system_test_case"

class ContratsTest < ApplicationSystemTestCase
  setup do
    @contrat = contrats(:one)
  end

  test "visiting the index" do
    visit contrats_url
    assert_selector "h1", text: "Contrats"
  end

  test "should create contrat" do
    visit contrats_url
    click_on "New contrat"

    fill_in "Information", with: @contrat.information_id
    fill_in "Name contrat", with: @contrat.name_contrat
    click_on "Create Contrat"

    assert_text "Contrat was successfully created"
    click_on "Back"
  end

  test "should update Contrat" do
    visit contrat_url(@contrat)
    click_on "Edit this contrat", match: :first

    fill_in "Information", with: @contrat.information_id
    fill_in "Name contrat", with: @contrat.name_contrat
    click_on "Update Contrat"

    assert_text "Contrat was successfully updated"
    click_on "Back"
  end

  test "should destroy Contrat" do
    visit contrat_url(@contrat)
    click_on "Destroy this contrat", match: :first

    assert_text "Contrat was successfully destroyed"
  end
end
