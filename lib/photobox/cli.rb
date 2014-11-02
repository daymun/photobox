require "thor"
require "photobox"

module Photobox
  class CLI < Thor
    default_task :info

    desc "cluster", "Group photos into folders by month"
    def cluster
      Photobox::Photo.cluster
    end

    desc "info", "View a summary of photo folders and their contents"
    def info
      Photobox::Photo.info
    end
  end
end
