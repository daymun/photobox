require "thor"
require "photobox"

module Photobox
  class CLI < Thor
    desc "cluster", "Group photos into folders by month"
    def cluster
      Photobox::Photo.cluster
    end
  end
end