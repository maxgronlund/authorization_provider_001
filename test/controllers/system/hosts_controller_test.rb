require 'test_helper'

class System::HostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @system_host = system_hosts(:one)
  end

  test "should get index" do
    get system_hosts_url
    assert_response :success
  end

  test "should get new" do
    get new_system_host_url
    assert_response :success
  end

  test "should create system_host" do
    assert_difference('System::Host.count') do
      post system_hosts_url, params: { system_host: { default: @system_host.default, name: @system_host.name, url: @system_host.url } }
    end

    assert_redirected_to system_host_url(System::Host.last)
  end

  test "should show system_host" do
    get system_host_url(@system_host)
    assert_response :success
  end

  test "should get edit" do
    get edit_system_host_url(@system_host)
    assert_response :success
  end

  test "should update system_host" do
    patch system_host_url(@system_host), params: { system_host: { default: @system_host.default, name: @system_host.name, url: @system_host.url } }
    assert_redirected_to system_host_url(@system_host)
  end

  test "should destroy system_host" do
    assert_difference('System::Host.count', -1) do
      delete system_host_url(@system_host)
    end

    assert_redirected_to system_hosts_url
  end
end
