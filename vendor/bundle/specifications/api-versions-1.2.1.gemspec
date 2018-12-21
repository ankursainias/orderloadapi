# -*- encoding: utf-8 -*-
# stub: api-versions 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "api-versions".freeze
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Erich Menge".freeze, "David Celis".freeze]
  s.date = "2015-02-23"
  s.description = "api-versions helps manage your Rails app API endpoints.".freeze
  s.email = ["erich.menge@me.com".freeze, "me@davidcel.is".freeze]
  s.homepage = "https://github.com/EDMC/api-versions".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 1.9".freeze)
  s.rubygems_version = "2.7.8".freeze
  s.summary = "api-versions helps manage your Rails app API endpoints.".freeze

  s.installed_by_version = "2.7.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>.freeze, [">= 3.0"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<ammeter>.freeze, ["= 0.2.5"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
    else
      s.add_dependency(%q<actionpack>.freeze, [">= 3.0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 3.0"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.0"])
      s.add_dependency(%q<ammeter>.freeze, ["= 0.2.5"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<actionpack>.freeze, [">= 3.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.0"])
    s.add_dependency(%q<ammeter>.freeze, ["= 0.2.5"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
  end
end
