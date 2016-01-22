require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: 'ExampleUser', email: 'example@user.com',
                      password: 'Password1', password_confirmation: 'Password1')
  end

  test 'Should be valid' do
    assert @user.valid?
  end

  test 'username should be present' do
    @user.username = ' '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'username should not be too long' do
    @user.username = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 256
    assert_not @user.valid?
  end

  test 'username should not be too short' do
    @user.username = 'a' * 2
    assert_not @user.valid?
  end

  test 'email should not be too short' do
    @user.email = 'a' * 4
    assert_not @user.valid?
  end

  test 'password should not be too short' do
    @user.password = 'a' * 5
    @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'email validation should accept valid email addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_USER@foo.bar.org
                         first.last@foo.jp name+name@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "Address #{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_address = %w[user@example,com user_at_foo.org
                         user.name@example. foo@bar_baz.com foo@bar+baz.com]
    @user.email = invalid_address
    assert_not @user.valid?, "Address #{invalid_address.inspect} should be invalid"
  end

  test 'email address should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'authenticated? should return false for a user with nil digest' do
    assert_not @user.authenticated?(:remember, '')
  end

  test 'associated users eventposts should be destroyed' do
    @user.save
    @user.eventposts.create!(title: 'Post title',
                             content: 'Post content.',
                             event_date: '2016-10-15')
    assert_difference 'Eventpost.count', -1 do
      @user.destroy
    end
  end

  test 'should follow and unfollow a user' do
    tommy = users(:tommy)
    tommy = users(:charlotte)

    assert_not tommy.following?(tommy)
    tommy.follow(tommy)
    assert tommy.following?(tommy)
    assert tommy.followers.include?(tommy)

    tommy.unfollow(tommy)
    assert_not tommy.following?(tommy)
  end

  # Status feed #
  test "feed should have the right posts" do
    tommy =     users(:tommy)
    charlotte = users(:charlotte)
    riggins =   users(:riggins)

    # Posts from the followed user
    # Tommy should see riggins posts.
    riggins.eventposts.each do |post_following|
      assert tommy.feed.include?(post_following)
    end

    # Post from self
    # Tommy should see his own posts.
    tommy.eventposts.each do |post_self|
      assert tommy.feed.include?(post_self)
    end

    # Posts from unfollowed user
    # Tommy should NOT see charlotte's posts.
    charlotte.eventposts.each do |post_unfollowed|
      assert_not tommy.feed.include?(post_unfollowed)
    end
  end



end
