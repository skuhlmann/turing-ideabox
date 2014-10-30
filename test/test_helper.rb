gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'sinatra/base'
require 'stringio'
require 'logger'
require 'rack/test'
require 'nokogiri'

$:.unshift File.expand_path("./../../lib", __FILE__)

require 'bundler'
Bundler.require

require 'app'

run IdeaBoxApp