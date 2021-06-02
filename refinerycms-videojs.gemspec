# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-videojs}
  s.version           = %q{0.6.3.0}
  s.summary           = %q{Videos extension for Refinery CMS}
  s.description       = %q{Manage videos in RefineryCMS using Video.js player for playback}
  s.email             = %q{admin@adexin.com}
  s.homepage          = %q{http://www.adexin.com}
  s.authors           = ['Anton Mishchuk']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"]

  s.add_dependency 'dragonfly', '>= 1.2', '< 1.5'
  s.add_dependency 'refinerycms-core', '~> 4.0.2'
  s.add_dependency 'refinerycms-acts-as-indexed', ['~> 3.0', '>= 3.0.0']
  s.add_dependency 'refinerycms-wymeditor', ['~> 2.0', '>= 2.0.0']
  s.add_dependency 'dragonfly-s3_data_store', '~> 1.3.0'
end
