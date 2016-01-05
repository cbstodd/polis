# -*- encoding: utf-8 -*-
# stub: bootstrap-will_paginate 0.0.10 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-will_paginate"
  s.version = "0.0.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nicholas Fine", "Isaac Bowen"]
  s.date = "2013-09-16"
  s.description = "Hooks into will_paginate to format the html to match Twitter Bootstrap styling.  Extension code was originally written by Isaac Bowen (https://gist.github.com/1182136)."
  s.email = ["nicholas.fine@gmail.com", "ikebowen@gmail.com"]
  s.homepage = "http://ndfine.com/2011/12/17/twitter-bootstrap-will-paginate.html"
  s.rubyforge_project = "bootstrap-will_paginate"
  s.rubygems_version = "2.5.1"
  s.summary = "Format will_paginate html to match Twitter Bootstrap styling."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<will_paginate>, [">= 0"])
    else
      s.add_dependency(%q<will_paginate>, [">= 0"])
    end
  else
    s.add_dependency(%q<will_paginate>, [">= 0"])
  end
end
