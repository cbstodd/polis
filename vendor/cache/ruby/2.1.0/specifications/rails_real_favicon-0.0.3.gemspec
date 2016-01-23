# -*- encoding: utf-8 -*-
# stub: rails_real_favicon 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "rails_real_favicon"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Philippe Bernard"]
  s.date = "2016-01-05"
  s.description = "Generate and install a favicon for all platforms with RealFaviconGenerator."
  s.email = ["philippe@realfavicongenerator.net"]
  s.homepage = "https://github.com/RealFaviconGenerator/rails_real_favicon"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Manage the favicon of your RoR project with RealFaviconGenerator"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["< 5", ">= 3.1"])
      s.add_runtime_dependency(%q<rest-client>, ["~> 1.8"])
      s.add_runtime_dependency(%q<json>, ["~> 1.7"])
      s.add_runtime_dependency(%q<rubyzip>, ["~> 1"])
    else
      s.add_dependency(%q<rails>, ["< 5", ">= 3.1"])
      s.add_dependency(%q<rest-client>, ["~> 1.8"])
      s.add_dependency(%q<json>, ["~> 1.7"])
      s.add_dependency(%q<rubyzip>, ["~> 1"])
    end
  else
    s.add_dependency(%q<rails>, ["< 5", ">= 3.1"])
    s.add_dependency(%q<rest-client>, ["~> 1.8"])
    s.add_dependency(%q<json>, ["~> 1.7"])
    s.add_dependency(%q<rubyzip>, ["~> 1"])
  end
end
