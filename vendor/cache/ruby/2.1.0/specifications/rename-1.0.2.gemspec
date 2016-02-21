# -*- encoding: utf-8 -*-
# stub: rename 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rename"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Morshed Alam"]
  s.date = "2013-09-30"
  s.description = "This library allows you to rename rails application using a single command"
  s.email = ["morshed201@gmail.com"]
  s.homepage = "https://github.com/morshedalam/rename"
  s.rubyforge_project = "rename"
  s.rubygems_version = "2.5.1"
  s.summary = "A library to rename your rails3 application"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
  end
end
