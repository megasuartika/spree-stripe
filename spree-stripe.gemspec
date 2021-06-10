# -*- encoding: utf-8 -*-
# stub: spree-stripe 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "spree-stripe".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Itsavirus".freeze]
  s.date = "2021-05-11"
  s.description = "Plugs Stripe Payment Gateway into Spree Stores".freeze
  s.email = ["hello@itsavirus.com".freeze]
  s.files = [".gitignore".freeze, "Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/spree/gateway/stripe_gateway.rb".freeze, "config/routes.rb".freeze, "lib/spree-stripe.rb".freeze, "lib/spree/stripe.rb".freeze, "lib/spree/stripe/engine.rb".freeze, "lib/spree/stripe/version.rb".freeze, "spree-stripe.gemspec".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Plugs Stripe Payment Gateway into Spree Stores".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<factory_girl>.freeze, [">= 0"])
      s.add_development_dependency(%q<pg>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-activemodel-mocks>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<sass-rails>.freeze, ["~> 4.0.2"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<spree_core>.freeze, [">= 2.4.0.beta"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<factory_girl>.freeze, [">= 0"])
      s.add_dependency(%q<pg>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-activemodel-mocks>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_dependency(%q<sass-rails>.freeze, ["~> 4.0.2"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<spree_core>.freeze, [">= 2.4.0.beta"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<factory_girl>.freeze, [">= 0"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-activemodel-mocks>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<sass-rails>.freeze, ["~> 4.0.2"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<spree_core>.freeze, [">= 2.4.0.beta"])
  end
end
