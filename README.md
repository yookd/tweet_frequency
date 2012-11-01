TweetFrequency
===============

Print out the most frequently used words in the last 1000 (or less) tweets. 

* Contractions count as two words: `don't`: `don` and `t`.
* Output has been downcased.
* I used my own OAuth keys and access tokens so continuous use might throw a rate-limit error.
* You can't access protected tweets so it will throw a `TweetFrequency::ProtectedUser` error.

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
> user = TweetFrequency::User.new('jack')
```

Find out the most frequently used words in the last 1000 tweets:

```ruby
> user.print_word_frequency
```

## Example Output
```
Jack Dorsey (@jack) has 12158 tweets. Here are his/her most frequently used words in the last 1000 tweets: 

http (454)
the (417)
rt (338)
to (286)
and (192)
a (191)
...
```

## Conclusion
This was the first gem I ever made and I must say the experience has been extremely rewarding.  Thank you for exposing me to this!
