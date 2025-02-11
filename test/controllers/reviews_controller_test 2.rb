# frozen_string_literal: true

require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get reviews_index_url
    assert_response :success
  end

  test 'should get new' do
    get reviews_new_url
    assert_response :success
  end
end
