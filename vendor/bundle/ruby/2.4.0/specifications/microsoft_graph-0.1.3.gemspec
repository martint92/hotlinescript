# -*- encoding: utf-8 -*-
# stub: microsoft_graph 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "microsoft_graph".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Katie Miller".freeze, "Neal Lindsay".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-06-13"
  s.email = ["katie@testdouble.com".freeze, "neal@testdouble.com".freeze]
  s.homepage = "https://graph.microsoft.io".freeze
  s.rubygems_version = "2.7.4".freeze
  s.summary = "Ruby SDK for Microsoft Graph".freeze

  s.installed_by_version = "2.7.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-given>.freeze, ["~> 3.5.0"])
      s.add_development_dependency(%q<adal>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<dotenv>.freeze, ["~> 2.0.2"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.10.3"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.11.1"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.22.6"])
      s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.8.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-given>.freeze, ["~> 3.5.0"])
      s.add_dependency(%q<adal>.freeze, ["~> 1.0"])
      s.add_dependency(%q<dotenv>.freeze, ["~> 2.0.2"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.10.3"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.11.1"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.22.6"])
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.8.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-given>.freeze, ["~> 3.5.0"])
    s.add_dependency(%q<adal>.freeze, ["~> 1.0"])
    s.add_dependency(%q<dotenv>.freeze, ["~> 2.0.2"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.10.3"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.11.1"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.22.6"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.8.0"])
  end
end
