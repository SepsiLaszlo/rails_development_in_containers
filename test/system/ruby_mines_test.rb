require "application_system_test_case"

class RubyMinesTest < ApplicationSystemTestCase
  setup do
    @ruby_mine = ruby_mines(:one)
  end

  test "visiting the index" do
    visit ruby_mines_url
    assert_selector "h1", text: "Ruby Mines"
  end

  test "creating a Ruby mine" do
    visit ruby_mines_url
    click_on "New Ruby Mine"

    fill_in "Name", with: @ruby_mine.name
    fill_in "Points", with: @ruby_mine.points
    click_on "Create Ruby mine"

    assert_text "Ruby mine was successfully created"
    click_on "Back"
  end

  test "updating a Ruby mine" do
    visit ruby_mines_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ruby_mine.name
    fill_in "Points", with: @ruby_mine.points
    click_on "Update Ruby mine"

    assert_text "Ruby mine was successfully updated"
    click_on "Back"
  end

  test "destroying a Ruby mine" do
    visit ruby_mines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ruby mine was successfully destroyed"
  end
end
