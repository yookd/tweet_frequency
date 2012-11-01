TweetFrequency
===============

Print out the most frequently used words in the last 1000 (or less) tweets.

## Setup
Install the gem:
`gem install tweet_frequency`
Open up irb:
`irb`
Add the gem:
`> require 'tweet_frequency'`

## Use
Specify a user e.g. 'jack':
`> user = User::TweetFrequency.new('jack')`
Find out the most frequently used words in the last 1000 tweets:
`> user.print_word_frequency`
