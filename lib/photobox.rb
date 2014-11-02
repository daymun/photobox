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
        if photos.count.zero?
          puts "No unclustered photos."
        else
          photos.each do |photo|
            photo_date = photo.split("/")[-1].split(" ")[0]
            next if defined?(last_photo_date) && photo_date == last_photo_date

            photo_month_dir = "#{PHOTOS_DIR}/#{photo_date}"
            puts "Creating directory: #{photo_month_dir}"
            FileUtils::mkdir_p(photo_month_dir)
            FileUtils.mv(Dir.glob("#{photo_month_dir}*.jpg"), photo_month_dir)
            last_photo_date = photo_date
          end
        end
      end

      def cluster_screenshots(screenshots)
        if screenshots.count.zero?
          puts "No unclustered screenshots."
        else
          puts "Moving screenshots to #{SCREENSHOTS_DIR}"
          FileUtils.mkdir_p(SCREENSHOTS_DIR)
          FileUtils.mv(screenshots, SCREENSHOTS_DIR)
        end
      end

      def cluster_videos(videos)
        if videos.count.zero?
          puts "No unclustered videos."
        else
          puts "Moving videos to #{VIDEOS_DIR}"
          FileUtils.mkdir_p(VIDEOS_DIR)
          FileUtils.mv(videos, VIDEOS_DIR)
        end
      end
    end
  end
end
