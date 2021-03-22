require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get feedback" do
    get feedbacks_feedback_url
    assert_response :success
  end

end
