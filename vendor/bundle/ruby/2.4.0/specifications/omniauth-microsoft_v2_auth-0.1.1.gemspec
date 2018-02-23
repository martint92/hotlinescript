# -*- encoding: utf-8 -*-
# stub: omniauth-microsoft_v2_auth 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-microsoft_v2_auth".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Caitlin Bales".freeze]
  s.date = "2018-01-30"
  s.description = "omniauth provider for Microsoft V2 Authentication".freeze
  s.email = ["c.bales@outlook.com".freeze]
  s.homepage = "https://github.com/cbales/omniauth-microsoft_v2_auth".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.4".freeze
  s.summary = "omniauth provider for Microsoft V2 Authentication".freeze

  s.installed_by_version = "2.7.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, [">= 0"])
    else
      s.add_dependency(%q<omniauth-oauth2>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<omniauth-oauth2>.freeze, [">= 0"])
  end
end
