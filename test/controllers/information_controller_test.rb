require "test_helper"

class InformationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @information = information(:one)
  end

  test "should get index" do
    get information_index_url
    assert_response :success
  end

  test "should get new" do
    get new_information_url
    assert_response :success
  end

  test "should create information" do
    assert_difference("Information.count") do
      post information_index_url, params: { information: { address: @information.address, address_pro: @information.address_pro, birthday: @information.birthday, diploma: @information.diploma, first_name: @information.first_name, gender: @information.gender, graduation_date: @information.graduation_date, n_ordinal: @information.n_ordinal, name: @information.name, place_birth: @information.place_birth, place_diploma: @information.place_diploma, registered_ordre: @information.registered_ordre } }
    end

    assert_redirected_to information_url(Information.last)
  end

  test "should show information" do
    get information_url(@information)
    assert_response :success
  end

  test "should get edit" do
    get edit_information_url(@information)
    assert_response :success
  end

  test "should update information" do
    patch information_url(@information), params: { information: { address: @information.address, address_pro: @information.address_pro, birthday: @information.birthday, diploma: @information.diploma, first_name: @information.first_name, gender: @information.gender, graduation_date: @information.graduation_date, n_ordinal: @information.n_ordinal, name: @information.name, place_birth: @information.place_birth, place_diploma: @information.place_diploma, registered_ordre: @information.registered_ordre } }
    assert_redirected_to information_url(@information)
  end

  test "should destroy information" do
    assert_difference("Information.count", -1) do
      delete information_url(@information)
    end

    assert_redirected_to information_index_url
  end
end
