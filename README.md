TweetFrequency
===============

Print out the most frequently used words in the last 1000 (or less) tweets.

## Setup
Install the gem:

```ruby
gem install tweet_frequency
```

Open up irb:

```ruby
irb
```

Add the gem:

```ruby
> require 'tweet_frequency'
```

## Use
Specify a user e.g. 'jack':

```ruby
> user = User::TweetFrequency.new('jack')
```

Find out the most frequently used words in the last 1000 tweets:

```ruby
> user.print_word_frequency
```

## Example Output
```
Jack Dorsey (@jack) has 12158 tweets. Here are his/her most frequently used words in the last 1000 tweets: 

http (456)
the (414)
rt (337)
to (285)
a (191)
and (191)
```
