# -*- encoding: utf-8 -*-
# stub: searchkick 1.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "searchkick"
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andrew Kane"]
  s.date = "2015-12-18"
  s.description = "Intelligent search made easy"
  s.email = ["andrew@chartkick.com"]
  s.homepage = "https://github.com/ankane/searchkick"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Searchkick learns what your users are looking for. As more people search, it gets smarter and the results get better. It\u{2019}s friendly for developers - and magical for your users."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>, [">= 0"])
      s.add_runtime_dependency(%q<elasticsearch>, [">= 1"])
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<activemodel>, [">= 0"])
      s.add_dependency(%q<elasticsearch>, [">= 1"])
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<activemodel>, [">= 0"])
    s.add_dependency(%q<elasticsearch>, [">= 1"])
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
