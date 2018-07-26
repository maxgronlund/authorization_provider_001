require "application_system_test_case"

class System::HostsTest < ApplicationSystemTestCase
  setup do
    @system_host = system_hosts(:one)
  end

  test "visiting the index" do
    visit system_hosts_url
    assert_selector "h1", text: "System/Hosts"
  end

  test "creating a Host" do
    visit system_hosts_url
    click_on "New System/Host"

    fill_in "Default", with: @system_host.default
    fill_in "Name", with: @system_host.name
    fill_in "Url", with: @system_host.url
    click_on "Create Host"

    assert_text "Host was successfully created"
    click_on "Back"
  end

  test "updating a Host" do
    visit system_hosts_url
    click_on "Edit", match: :first

    fill_in "Default", with: @system_host.default
    fill_in "Name", with: @system_host.name
    fill_in "Url", with: @system_host.url
    click_on "Update Host"

    assert_text "Host was successfully updated"
    click_on "Back"
  end

  test "destroying a Host" do
    visit system_hosts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Host was successfully destroyed"
  end
end
