Gem::Specification.new do |s|
  s.name = %q{tweet_frequency}
  s.version = '0.0.3'
  s.date = %q{2012-11-05}
  s.description = %q{TweetFrequency will print out the most frequently used words in the most recent 1000 tweets, sorted by descending order.}
  s.summary = %q{Print out most frequently used words in 1000 tweets, sorted by descending order.}
  s.authors = ['David Yoo']
  s.email = %q{dkyoo10@gmail.com}
  s.homepage = %{http://www.github.com/yookd/tweet_frequency}

  s.files = `git ls-files`.split("\n")

  s.require_paths = ['lib']
  s.add_dependency "twitter"
end
