# frozen_string_literal: true

require_relative "studio_ghibli/version"
require_relative "studio_ghibli/api"
require_relative "studio_ghibli/cli"
require_relative "studio_ghibli/film"
require_relative "studio_ghibli/string"

module StudioGhibli
  class Error < StandardError; end
  instance = CLI.new
  instance.call
  # Your code goes here...
end


