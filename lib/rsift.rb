$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "rsift/connection"
require "rsift/stream"

module Rsift
  class << self
  
    def escape_options(options)
      options.map { |k, v| "#{k}=#{CGI::escape(v.to_s)}" }
    end
  end
end