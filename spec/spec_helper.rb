require 'rubygems'
require 'spec'
require 'redgreen'
require 'rr'
require 'fileutils'

Spec::Runner.configure do |config|
  config.mock_with :rr
end
