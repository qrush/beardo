require 'rubygems'
require 'yaml'
require 'rest_client'
require 'optparse'

class Beardo
  attr_accessor :group, :email, :password

  def initialize(config)
    self.group = config['group']
    self.email = config['email']
    self.password = config['password']
  end

  def post(message)
    resource = RestClient::Resource.new("http://coopapp.com", {
      :user => self.email, :password => self.password
    })
    resource["groups/#{self.group}/statuses"].post("<status>#{message}</status>", :content_type => 'application/xml')
  end

  class << self
    def config_path
      ENV['HOME']
    end

    def config_file
      File.join(config_path, '.beardorc')
    end

    def run(args)
      beardo = Beardo.new(read_config)
      beardo.post(args[0])
    end

    def read_config
      YAML.load_file(config_file)
    end
  end
end
