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
    # @options [Integer] tweets number of tweets
    # @options [Boolean] include_rts include retweets
    def word_frequency
      # Set default parameters
      params = {
        tweets: [@statuses_count, 1000].min,
        include_rts: true
      }
      result = {}

      # Get the tweets which will be in @timeline
      get_timeline(params[:tweets])

      # Go through each tweet in the timeline
      # [key] word => [value] number of times it is used
      @timeline.each do |tweet|
        tweet.downcase.split.each do |t|
          words = t.text.match(/w+/)
          words.each do |word|
            if result.has_key?(word)
              result[word] += 1
            else
              result[word] = 1
            end
          end
        end
      end

      puts result
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

          # max_id gets results with id less than AND equal to so get 1 more tweet
          # also need to avoid putting in the same tweet
          if options[:max_id]
            options[:count] = options[:count] + 1
            tweets = Twitter.user_timeline(@screen_name, options)

            # Top tweet is the max_id so delete index 0
            tweets.shift
          else
            tweets = Twitter.user_timeline(@screen_name, options)
          end

          # Tweets come in an array so add each individually
          tweets.each { |tweet| @timeline.push(tweet) }
        end
      end
    end
  end
end
