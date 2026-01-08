# frozen_string_literal: true

#--
# SPDX-FileCopyrightText: 2026 Kerrick Long <me@kerricklong.com>
# SPDX-License-Identifier: LGPL-3.0-or-later
#++

require_relative "lib/ratatui_ruby/kit/version"

Gem::Specification.new do |spec|
  spec.name = "ratatui_ruby-kit"
  spec.version = RatatuiRuby::Kit::VERSION
  spec.authors = ["Kerrick Long"]
  spec.email = ["me@kerricklong.com"]

  spec.summary = "Part of the RatatuiRuby ecosystem"
  spec.description = "RatatuiRuby::Kit - part of the RatatuiRuby TUI framework ecosystem"
  spec.homepage = "https://sr.ht/~kerrick/ratatui_ruby/"
  spec.license = "LGPL-3.0-or-later"
  spec.required_ruby_version = [">= 3.2.9", "< 5"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["bug_tracker_uri"] = "https://todo.sr.ht/~kerrick/ratatui_ruby"
  spec.metadata["mailing_list_uri"] = "https://lists.sr.ht/~kerrick/ratatui_ruby-discuss"
  spec.metadata["source_code_uri"] = "https://git.sr.ht/~kerrick/ratatui_ruby-kit"
  spec.metadata["changelog_uri"] = "https://git.sr.ht/~kerrick/ratatui_ruby-kit/tree/stable/item/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://git.sr.ht/~kerrick/ratatui_ruby-kit/tree/HEAD/doc/index.md"
  spec.metadata["wiki_uri"] = "https://man.sr.ht/~kerrick/ratatui_ruby/"
  spec.metadata["funding_uri"] = "https://opencollective.com/ratatui" # Don't fund me, fund the upstream project.
  spec.metadata["rubygems_mfa_required"] = "true"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ostruct", "~> 0.6"
  spec.add_development_dependency "rdoc", "~> 7.0"
  spec.add_development_dependency "faker", "~> 3.5"
end
