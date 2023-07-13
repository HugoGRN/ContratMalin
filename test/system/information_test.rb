require "application_system_test_case"

class InformationTest < ApplicationSystemTestCase
  setup do
    @information = information(:one)
  end

  test "visiting the index" do
    visit information_url
    assert_selector "h1", text: "Information"
  end

  test "should create information" do
    visit information_url
    click_on "New information"

    fill_in "Address", with: @information.address
    fill_in "Address pro", with: @information.address_pro
    fill_in "Birthday", with: @information.birthday
    fill_in "Diploma", with: @information.diploma
    fill_in "First name", with: @information.first_name
    fill_in "Gender", with: @information.gender
    fill_in "Graduation date", with: @information.graduation_date
    fill_in "N ordinal", with: @information.n_ordinal
    fill_in "Name", with: @information.name
    fill_in "Place birth", with: @information.place_birth
    fill_in "Place diploma", with: @information.place_diploma
    fill_in "Registered ordre", with: @information.registered_ordre
    click_on "Create Information"

    assert_text "Information was successfully created"
    click_on "Back"
  end

  test "should update Information" do
    visit information_url(@information)
    click_on "Edit this information", match: :first

    fill_in "Address", with: @information.address
    fill_in "Address pro", with: @information.address_pro
    fill_in "Birthday", with: @information.birthday
    fill_in "Diploma", with: @information.diploma
    fill_in "First name", with: @information.first_name
    fill_in "Gender", with: @information.gender
    fill_in "Graduation date", with: @information.graduation_date
    fill_in "N ordinal", with: @information.n_ordinal
    fill_in "Name", with: @information.name
    fill_in "Place birth", with: @information.place_birth
    fill_in "Place diploma", with: @information.place_diploma
    fill_in "Registered ordre", with: @information.registered_ordre
    click_on "Update Information"

    assert_text "Information was successfully updated"
    click_on "Back"
  end

  test "should destroy Information" do
    visit information_url(@information)
    click_on "Destroy this information", match: :first

    assert_text "Information was successfully destroyed"
  end
end
