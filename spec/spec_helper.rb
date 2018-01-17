require 'require_all'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_rel '../lib'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::Console,
    SimpleCov::Formatter::HTMLFormatter
  ]
)
SimpleCov.start

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

