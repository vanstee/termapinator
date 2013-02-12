# encoding: utf-8

require 'termapinator/version'
require 'open-uri'
require 'chunky_png'
require 'rainbow'
require 'optparse'

module Termapinator
  DEFAULT_OPTIONS = {
      size: '640x640',
      sensor: true,
      style: 'element:labels|visibility:off'
  }

  def self.run(options)
    image = load_image(google_maps_request(options))
    ascii = image_to_ascii(image)
    puts ascii
  end

  def self.google_maps_request(options)
    uri = URI.parse("http://maps.googleapis.com/maps/api/staticmap")
    params = DEFAULT_OPTIONS.merge(options)
    uri.query = params.map { |k, v| "#{k}=#{URI.escape(v.to_s)}" }.join('&')
    uri
  end


  def self.load_image(url)
    image = nil

    open(url) do |f|
      image = ChunkyPNG::Image.from_blob(f.read)
    end

    image
  end

  def self.image_to_ascii(image)
    image.resample_nearest_neighbor!(80, 30)
    squares = image.pixels.map { |pixel| colored_square(pixel) }
    squares.each_slice(80).map { |square| square.join }.join("\n")
  end

  def self.colored_square(color)
    '▇'.color(ChunkyPNG::Color.r(color), ChunkyPNG::Color.g(color), ChunkyPNG::Color.b(color))
  end
end
