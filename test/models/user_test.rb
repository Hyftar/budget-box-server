require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
  end

  test 'should be valid user' do
    @u = User.new(
      name: 'thomas',
      email: 'test@example.com',
      password: 'test12345',
      password_confirmation: 'test12345'
    )

    assert @u.save, 'Should be valid user'

    # Name tests
    @u.name = 'tom' # Tom already exists in user fixtures
    assert_not @u.save, 'Name should be unique and case insensitive'

    @u.name = 'a'
    assert_not @u.save, 'Name should be between 2 and 15 characters (1)'

    @u.name = 'a' * 16
    assert_not @u.save, 'Name should be between 2 and 15 characters (16)'

    @u.name = nil
    assert_not @u.save, 'Name should be required'

    # Email tests
    @u.email = 'invalid_email'
    assert_not @u.save, 'Email should be valid'

    @u.email = 'test@example.org'
    assert_not @u.save, 'Email should be unique' # Tom has the same email in fixtures

    # Password tests
    @u = User.new(
      name: 'Mathias',
      email: 'mathias@example.org',
      password: 'test12345',
    )
    @u.password_confirmation = 'bleh'
    assert_not @u.valid?, 'Password confirmation should be equal to password'

    @u.password = 'blah'
    @u.password_confirmation = 'blah'
    assert_not @u.valid?, 'Password should be between 8 and 128 characters (6)'


    @u.password = 'a' * 129
    @u.password_confirmation = 'a' * 129
    assert_not @u.valid?, 'Password should be between 8 and 128 characters (128)'

    @u.password = 'test12345'
    @u.password_confirmation = 'test12345'
    assert @u.valid?, 'User should be valid if password and confirmation are equal'
  end
end
