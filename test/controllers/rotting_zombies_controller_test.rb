require 'test_helper'

class RottingZombiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rotting_zombies_index_url
    assert_response :success
  end

end
