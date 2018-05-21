# -*- encoding: utf-8 -*-
# stub: mailgun-ruby 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "mailgun-ruby".freeze
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mailgun".freeze, "Travis Swientek".freeze]
  s.date = "2014-11-20"
  s.description = "Mailgun's Official Ruby SDK for interacting with the Mailgun API.".freeze
  s.email = "support@mailgunhq.com".freeze
  s.homepage = "http://www.mailgun.com".freeze
  s.licenses = ["Apache".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Mailgun's Official Ruby SDK".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 1.6"])
      s.add_runtime_dependency(%q<json>.freeze, ["~> 1.8"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_dependency(%q<rest-client>.freeze, ["~> 1.6"])
      s.add_dependency(%q<json>.freeze, ["~> 1.8"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 1.6"])
    s.add_dependency(%q<json>.freeze, ["~> 1.8"])
  end
end
