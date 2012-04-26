require 'rubygems'
require 'uri'
require 'net/http'
require 'json'

module RMigreme
  URL_API = "http://migre.me/"

  def self.short(url)
    request("api.json?url=#{url}")["migre"]
  end

  def self.redirect(url)
    request("api_redirect.json?url=#{url}")["url"]
  end

  private 

  def self.request(url)
    uri = URI.parse(URL_API+url)
    respost = JSON.parse(Net::HTTP.get_response(uri).body)

    if not respost["erro"].nil? and not respost["erro"].eql?(0)
      raise respost["info"].to_s
    end

    respost
  end

end