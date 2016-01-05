# -*- encoding: utf-8 -*-
# stub: minitest-reporters 1.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-reporters"
  s.version = "1.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alexander Kern"]
  s.date = "2014-07-05"
  s.description = "Death to haphazard monkey-patching! Extend Minitest through simple hooks."
  s.email = ["alex@kernul.com"]
  s.homepage = "https://github.com/CapnKernul/minitest-reporters"
  s.rubyforge_project = "minitest-reporters"
  s.rubygems_version = "2.5.1"
  s.summary = "Create customizable Minitest output formats"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, [">= 5.0"])
      s.add_runtime_dependency(%q<ansi>, [">= 0"])
      s.add_runtime_dependency(%q<ruby-progressbar>, [">= 0"])
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_development_dependency(%q<maruku>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, [">= 5.0"])
      s.add_dependency(%q<ansi>, [">= 0"])
      s.add_dependency(%q<ruby-progressbar>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<maruku>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 5.0"])
    s.add_dependency(%q<ansi>, [">= 0"])
    s.add_dependency(%q<ruby-progressbar>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<maruku>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
