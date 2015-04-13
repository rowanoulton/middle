require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'invalid signup information does not create new user' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: '',
                               email: 'user@invalid',
                               password: 'foo',
                               password_confirmation: 'bar' }
    end
    assert_template 'users/new'
  end

  test 'valid signup information creates new user' do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: 'Rowan',
                                            email: 'user@valid.com',
                                            password: 'foo123',
                                            password_confirmation: 'foo123' }
    end
    assert_template 'users/show'
  end
end
