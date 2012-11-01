module TweetFrequency

  # TweetFrequency::User.new('some_user_name')
  class User
    attr_accessor :name, :screen_name, :statuses_count, :timeline

    # Create user
    #
    # @param [String] name Twitter username
    def initialize(name)
      user = Twitter.user(name)

      raise TweetFrequency::Error::ProtectedUser, 'User has protected tweets.' if user.protected?

      @name = user.name
      @screen_name = user.screen_name
      @statuses_count = user.statuses_count
      @timeline = []
    end

    # Find the most frequently used words in tweet
    #
    # @param [Hash] options
    # @options [Integer] tweets number of tweets
    # @options [Boolean] include_rts include retweets
    def word_frequency(options={})
      # Set default parameters
      params = {
        tweets: [@statuses_count, 1000].min,
        include_rts: true
      }
      params.merge!(options)
    end

    # Get user's timeline
    #
    # Constraints:
    # Can only retrieve 200 tweets at a time
    # Can only return up to 3200 tweets
    #
    #
    # @param [Integer] count number of tweets
    def get_timeline(count=1000)
      # Max number of tweets is 3200
      count = [count, 3200].min
      options = {}

      # Cache timeline array
      if @timeline.count < count
        while @timeline.count < count

          # Can only retrieve 200 per request
          options[:count] = [200, count - @timeline.count].min

          # Duplicate tweets
          options[:max_id] = @timeline.last.id unless @timeline.empty?

          tweet = Twitter.user_timeline(@name, options)

          tweet.each { |t| @timeline.push(t) }
        end
      end
    end
  end
end
