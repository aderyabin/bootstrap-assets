require 'rails/generators'
require 'net/http'
require "fileutils"

module BootstrapAssets
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs Twitter Bootstrap to Asset Pipeline"

      def download_assets
        plugins = %w(alert button carousel collapse dropdown modal popover scrollspy tab tooltip transition typeahead)
        less = %w(accordion alerts bootstrap breadcrumbs button-groups buttons carousel close code component-animations dropdowns forms grid hero-unit labels-badges layouts mixins modals navbar navs pager pagination popovers progress-bars reset responsive-767px-max responsive-768px-979px responsive-1200px-min responsive-navbar responsive-utilities responsive scaffolding sprites tables thumbnails tooltip type utilities variables wells)
        images = %w(glyphicons-halflings-white glyphicons-halflings)


        js_path = 'vendor/assets/javascripts/twitter/bootstrap'
        less_path = 'vendor/assets/stylesheets/twitter/bootstrap'
        img_path =  'vendor/assets/images/twitter/bootstrap'

        FileUtils.mkdir_p(js_path)
        FileUtils.mkdir_p(less_path)
        FileUtils.mkdir_p(img_path)

        plugins.each do |plugin|
          filename = "bootstrap-#{plugin}.js"
          download("https://raw.github.com/twitter/bootstrap/master/js/#{filename}", "#{js_path}/#{filename}")
        end

        less.each do |l|
          filename = "#{l}.less"
          download("https://raw.github.com/twitter/bootstrap/master/less/#{filename}", "#{less_path}/#{filename}")
        end

        images.each do |image|
          filename = "#{image}.png"
          download("https://github.com/twitter/bootstrap/raw/master/img/#{filename}", "#{img_path}/#{filename}")
        end
      end

      def add_assets
        text = <<-EOF
@import "twitter/bootstrap/bootstrap";
// Set the correct sprite paths
@iconSpritePath: asset-path('twitter/bootstrap/glyphicons-halflings.png');
@iconWhiteSpritePath: asset-path('twitter/bootstrap/glyphicons-halflings-white.png');
        EOF

        add_bootstrap_file 'vendor/assets/stylesheets/twitter/bootstrap.css.less', text
        add_bootstrap_file 'vendor/assets/stylesheets/twitter/responsive.css.less', '@import "twitter/bootstrap/responsive";'
        add_bootstrap_file 'vendor/assets/javascripts/twitter/bootstrap.js', '//=require_directory "./bootstrap"'
      end

      protected

      def download(source, target)
        puts "Downloading: #{source}"
        uri = URI(source)
        Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
          request = Net::HTTP::Get.new uri.request_uri
          http.request request do |response|
            open target, 'wb' do |io|
              response.read_body do |chunk|
                io.write chunk
              end
            end
          end
        end
      end

      def add_bootstrap_file(filename, text)
        create_file filename, text unless File.exist?(filename)
      end
    end
  end
end