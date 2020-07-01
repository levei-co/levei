require "application_system_test_case"

class ReversesTest < ApplicationSystemTestCase
  setup do
    @reverse = reverses(:one)
  end

  test "visiting the index" do
    visit reverses_url
    assert_selector "h1", text: "Reverses"
  end

  test "creating a Reverse" do
    visit reverses_url
    click_on "New Reverse"

    fill_in "Order", with: @reverse.order_id
    fill_in "Reason", with: @reverse.reason
    fill_in "Status", with: @reverse.status
    fill_in "User", with: @reverse.user_id
    click_on "Create Reverse"

    assert_text "Reverse was successfully created."
    click_on "Back"
  end

  test "updating a Reverse" do
    visit reverses_url
    click_on "Edit it", match: :first

    fill_in "Order", with: @reverse.order_id
    fill_in "Reason", with: @reverse.reason
    fill_in "Status", with: @reverse.status
    fill_in "User", with: @reverse.user_id
    click_on "Update Reverse"

    assert_text "Reverse was successfully updated."
    click_on "Back"
  end

  test "destroying a Reverse" do
    visit reverses_url
    page.accept_confirm do
      click_on "Destroy it", match: :first
    end

    assert_text "Reverse was successfully destroyed."
  end
end
