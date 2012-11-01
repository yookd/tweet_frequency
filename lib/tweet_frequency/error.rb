module TweetFrequency
  class Error < StandardError
    def initialize(message)
      super
    end
  end

  class ProtectedUser < Error; end
end
