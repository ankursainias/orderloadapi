# -*- encoding: utf-8 -*-
# stub: acts_as_dashboard 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "acts_as_dashboard".freeze
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Hoffman".freeze]
  s.date = "2010-08-08"
  s.description = "acts_as_dashboard makes it easy to create dashboards in Rails apps. Very little configuration is required. Read the docs to get started.".freeze
  s.email = "nick@deadorange.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.homepage = "http://github.com/nickhoffman/acts_as_dashboard".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "2.7.8".freeze
  s.summary = "Create dashboards in Rails apps easily.".freeze

  s.installed_by_version = "2.7.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 1.2.9"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 1.3.2"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 1.2.9"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 1.3.2"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 1.2.9"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 1.3.2"])
  end
end
