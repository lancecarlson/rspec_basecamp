require 'rubygems'
require 'builder'
require 'net/http'
require 'net/https'
require 'yaml'

$LOAD_PATH.unshift File.dirname(__FILE__) unless
  $LOAD_PATH.include?(File.dirname(__FILE__)) ||
  $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))

require 'rspec_basecamp/version'
require 'rspec_basecamp/basecamp'
require 'rspec_basecamp/runner'