if ENV['CI']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start
end

require 'minitest'
require 'pathname'
require 'mocha/mini_test'
require 'byebug'

require_relative 'support/utils'

module Byebug
  #
  # Extends Minitest's base test case and provides defaults for all tests
  #
  class TestCase < Minitest::Test
    #
    # Reset to default state before each test
    #
    def setup
      Byebug.handler = Byebug::CommandProcessor.new(Byebug::TestInterface.new)
      Byebug.breakpoints.clear if Byebug.breakpoints
      Byebug.catchpoints.clear if Byebug.catchpoints

      Byebug::Setting.load
      Byebug::Setting[:autolist] = false
      Byebug::Setting[:testing] = true
      Byebug::Setting[:width] = 80

      byebug_bin = File.expand_path('../../../bin/byebug', __FILE__)
      force_set_const(Byebug, 'BYEBUG_SCRIPT', byebug_bin)

      # include test files as ignored files
      glob_exp = File.expand_path('../../{lib,test/support}/**/*.rb', __FILE__)
      ignored_files = Dir.glob(glob_exp) + ['test/test_helper.rb']
      force_set_const(Byebug, 'IGNORED_FILES', ignored_files)

      force_set_const(Byebug, 'PROG_SCRIPT', $PROGRAM_NAME)
    end

    include Byebug::TestUtils
  end
end

# Init globals to avoid warnings
$binding = binding # this is from irb...

# Load the test files from the command line.
argv = ARGV.select do |argument|
  case argument
  when /^-/ then
    argument
  when /\*/ then
    Dir.glob('test/**/*_test.rb').each do |file|
      require File.expand_path file
    end
    false
  else
    require File.expand_path argument
    false
  end
end

# Run the tests
Minitest.run argv
