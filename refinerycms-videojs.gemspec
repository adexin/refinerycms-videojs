# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-videojs}
  s.version           = %q{0.6.0.0}
  s.summary           = %q{Videos extension for Refinery CMS}
  s.description       = %q{Manage videos in RefineryCMS using Video.js player for playback}
  s.email             = %q{admin@adexin.com}
  s.homepage          = %q{http://www.adexin.com}
  s.authors           = ['Anton Mishchuk']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"]

  s.add_dependency 'dragonfly', '~>1.2.0'
  s.add_dependency 'refinerycms-core', '~>4.0.2'
  s.add_dependency 'dragonfly-s3_data_store', '~>1.3.0'

  s.add_development_dependency 'capybara-webkit', '~>1.15.1'
  s.add_development_dependency 'capybara-screenshot', '~>1.0.24'
  s.add_development_dependency 'factory_girl_rails', '~>4.9.0'
  s.add_development_dependency 'simplecov', '~>0.18.2'
  s.add_development_dependency 'refinerycms-testing', '~>4.0.2'
end
