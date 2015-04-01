# coding: utf-8
Gem::Specification.new do |spec|
  spec.name     = 'etcd-env'
  spec.version  = '0.0.3'
  spec.authors  = ['Charles Martinot', 'Omar Khan']
  spec.email    = ['techadmin@playlab.com']
  spec.summary  = 'Run a command with environment variables from etcd'
  spec.homepage = 'https://github.com/pocket-playlab/etcd-env'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test|spec|features)\//)
  end

  spec.bindir      = 'exe'
  spec.executables = spec.files.grep(/^exe\//) { |f| File.basename(f) }

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
