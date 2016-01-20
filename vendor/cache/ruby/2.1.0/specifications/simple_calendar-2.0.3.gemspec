# -*- encoding: utf-8 -*-
# stub: simple_calendar 2.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "simple_calendar"
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chris Oliver"]
  s.date = "2015-10-05"
  s.description = "A simple Rails 3 and Rails 4 calendar"
  s.email = ["excid3@gmail.com"]
  s.executables = ["console", "setup"]
  s.files = ["bin/console", "bin/setup"]
  s.homepage = "https://github.com/excid3/simple_calendar"
  s.licenses = ["MIT"]
  s.rubyforge_project = "simple_calendar"
  s.rubygems_version = "2.5.1"
  s.summary = "A simple Rails 3 and Rails 4 calendar"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
