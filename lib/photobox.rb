require "photobox/version"
require "fileutils"

module Photobox
  class Photo
    PHOTOS_DIR      = File.expand_path("~/Dropbox/Camera Uploads")
    SCREENSHOTS_DIR = "#{PHOTOS_DIR}/Screenshots"
    VIDEOS_DIR      = "#{PHOTOS_DIR}/Videos"

    class << self
      def cluster
        files       = Dir.glob("#{PHOTOS_DIR}/*.*")
        photos      = Dir.glob("#{PHOTOS_DIR}/*.jpg")
        screenshots = Dir.glob("#{PHOTOS_DIR}/*.png")
        videos      = Dir.glob("#{PHOTOS_DIR}/*.{mov,mp4}")

        if files.count.zero?
          puts "No unclustered files."
        else
          cluster_photos(photos)
          cluster_screenshots(screenshots)
          cluster_videos(videos)
        end
      end

      protected

      def cluster_photos(photos)
        unless photos.count.zero?
          month_dirs = photos.map do |photo|
            "#{PHOTOS_DIR}/#{photo.split("/").last[0..6]}"
          end

          month_dirs.uniq.each do |month_dir|
            month_photos = Dir.glob("#{month_dir}*.jpg")
            puts "Moving #{month_photos.count} photos to `#{month_dir}`"
            FileUtils::mkdir_p(month_dir)
            FileUtils.mv(month_photos, month_dir)
          end
        end
      end

      def cluster_screenshots(screenshots)
        unless screenshots.count.zero?
          puts "Moving #{screenshots.count} screenshots to `#{SCREENSHOTS_DIR}`"
          FileUtils.mkdir_p(SCREENSHOTS_DIR)
          FileUtils.mv(screenshots, SCREENSHOTS_DIR)
        end
      end

      def cluster_videos(videos)
        unless videos.count.zero?
          puts "Moving #{videos.count} videos to `#{VIDEOS_DIR}`"
          FileUtils.mkdir_p(VIDEOS_DIR)
          FileUtils.mv(videos, VIDEOS_DIR)
        end
      end
    end
  end
end
