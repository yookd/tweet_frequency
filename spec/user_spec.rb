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
      expect { @user = TweetFrequency::User.new('yoo_david') }.to raise_error
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
      @user.get_timeline(3)
      @user.timeline.count.should == 3
    end

    it 'should get more than 1000 tweets' do
      @user.get_timeline(1234)
      @user.timeline.count.should == 1234
    end
  end

  context 'Get word frequency' do
    before do
      @user = TweetFrequency::User.new('jack')
    end

    it 'should get the word frequency' do
      @user.word_frequency
    end
  end
end
