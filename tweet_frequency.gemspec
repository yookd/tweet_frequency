Gem::Specification.new do |s|
  s.name = %q{tweet_frequency}
  s.version = '0.0.0'
  s.date = %q{2012-11-01}
  s.summary = %q{Print out most frequently used words in 1000 tweets, sorted by descending order.}
  s.description = %q{Print out most frequently used words in 1000 tweets, sorted by descending order.}
  s.authors = ['David Yoo']
  s.email = %q{dkyoo10@gmail.com}

  s.files = `git ls-files`.split("\n")

  s.require_paths = ['lib']
end
