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
end
