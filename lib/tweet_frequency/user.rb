module TweetFrequency

  # TweetFrequency::User.new('some_user_name')
  class User

    def initialize(name)
      @user = Twitter.user(name)

      if @user.protected?
        raise TweetFrequency::Error::ProtectedUser, 'User has protected tweets.'
      end
    end
  end
end
