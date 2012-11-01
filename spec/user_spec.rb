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
  end

  context '' do

  end
end
