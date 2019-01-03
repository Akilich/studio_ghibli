require 'nokogiri'
require 'open-uri'
require 'json'
require 'pry'
require_relative "./studio_ghibli/version"
require_relative "./studio_ghibli/api"
require_relative "./studio_ghibli/film"
require_relative "./studio_ghibli/studio_ghibli_controller"

module StudioGhibli
  class Error < StandardError; end
  # Your code goes here...
end
