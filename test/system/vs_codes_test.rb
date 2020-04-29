require "application_system_test_case"

class VsCodesTest < ApplicationSystemTestCase
  setup do
    @vs_code = vs_codes(:one)
  end

  test "visiting the index" do
    visit vs_codes_url
    assert_selector "h1", text: "Vs Codes"
  end

  test "creating a Vs code" do
    visit vs_codes_url
    click_on "New Vs Code"

    fill_in "Name", with: @vs_code.name
    fill_in "Points", with: @vs_code.points
    click_on "Create Vs code"

    assert_text "Vs code was successfully created"
    click_on "Back"
  end

  test "updating a Vs code" do
    visit vs_codes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @vs_code.name
    fill_in "Points", with: @vs_code.points
    click_on "Update Vs code"

    assert_text "Vs code was successfully updated"
    click_on "Back"
  end

  test "destroying a Vs code" do
    visit vs_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vs code was successfully destroyed"
  end
end
