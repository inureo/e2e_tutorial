ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'database_cleaner'
require 'factory_girl'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'active_record/fixtures'
require 'pry'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Capybara.configure do |config|
  config.default_driver    = :poltergeist
  config.javascript_driver = :poltergeist
  config.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 60)
  end
end

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    # seed_tables              = %w(toppage_theme)
    # DatabaseCleaner.strategy = :truncation, { except: seed_tables }
    # DatabaseCleaner.clean_with(:truncation,  except: seed_tables)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
end
