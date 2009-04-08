# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{beardo}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Quaranto", "Mike Burns"]
  s.date = %q{2009-04-08}
  s.default_executable = %q{bd}
  s.description = %q{Communicate with co-workers through the best interface available: your terminal}
  s.email = %q{nick@quaran.to}
  s.executables = ["bd"]
  s.extra_rdoc_files = ["README.textile"]
  s.files = ["README.textile", "VERSION.yml", "bin/bd", "lib/beardo.rb", "spec/beardo_spec.rb", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/qrush/beardo}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A command line client for Harvest Co-op}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<adamwiggins-rest-client>, [">= 0.9.2"])
    else
      s.add_dependency(%q<adamwiggins-rest-client>, [">= 0.9.2"])
    end
  else
    s.add_dependency(%q<adamwiggins-rest-client>, [">= 0.9.2"])
  end
end
