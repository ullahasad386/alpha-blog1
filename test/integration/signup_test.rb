require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest


  test "users should be able to signup" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count' do
      post_via_redirect users_path, user: { username: "Ali", email: "ali@example.com", password: "password", admin: false }
    end
    assert_template 'users/show'
  end

  test "invalid user signup" do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post_via_redirect users_path, user: {username: "Ali", email: " ", password: "password", admin: false}
    end
    assert_template 'users/new'
  end

end
