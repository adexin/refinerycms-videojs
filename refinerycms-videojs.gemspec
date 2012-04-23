# Encoding: UTF-8
Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-videojs}
  s.version           = %q{0.5.2}
  s.summary           = %q{Videos extension for Refinery CMS}
  s.description       = %q{Manage video in RefineryCMS}
  s.email             = %q{amishchuk@adexin.com}
  s.homepage          = %q{http://www.adexin.com}
  s.rubyforge_project = %q{refinerycms-videojs}
  s.authors           = ['Anton Mishchuk']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)
  
  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency 'dragonfly'
  s.add_dependency 'rack-cache'
  s.add_dependency 'refinerycms-core'
end
