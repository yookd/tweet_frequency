require 'spec_helper'

describe 'TweetFrequency::User' do
  context 'Initializing a new user with a username' do
    before do
      @user = TweetFrequency::User.new('jack')
    end

    it 'should create a new User object successfully' do
      @user.should be_an_instance_of TweetFrequency::User
    end
  end

  context 'Initializing a user with protected tweets' do
    it 'should raise a ProtectedUser error' do
      expect { @user = TweetFrequency::User.new('yoo_david') }.to raise_error(TweetFrequency::ProtectedUser)
    end
  end

  context 'Get user timeline' do
    before do
      @user = TweetFrequency::User.new('jack')
    end

    # TO DO:
    # Change this to 1000 tweets!!!
    it 'should get 1000 tweets' do
      @user.get_timeline
      @user.timeline.count.should == 1000
    end

    it 'should get less than 1000 tweets' do
      @user.get_timeline(1)
      @user.timeline.count.should == 1
    end

    it 'should get more than 1000 tweets' do
      @user.get_timeline(1234)
      @user.timeline.count.should == 1234
    end

    it 'should not have duplicate tweets' do
      tweets = {}
      found = false

      # Populate timeline and go through each tweet
      @user.get_timeline
      @user.timeline.each do |tweet|
        if tweets.has_key?(tweet.id)
          found = true
          break
        else
          tweets[tweet.id] = true
        end
      end

      found.should be_false
    end
  end
end
