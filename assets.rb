require 'sprockets'

class Assets < Sinatra::Base
  configure do
    set :assets, (Sprockets::Environment.new { |env|
      env.append_path(settings.root + "/public/img")
      env.append_path(settings.root + "/public/js")
      env.append_path(settings.root + "/public/css")
    })
  end

  get "/assets/app.js" do
    content_type("application/javascript")
    settings.assets["app.js"]
  end

  get "/assets/app.css" do
    content_type("text/css")
    settings.assets["app.css"]
  end

  %w{jpg png}.each do |format|
    get "/assets/:image.#{format}" do |image|
      content_type("image/#{format}")
      settings.assets["#{image}.#{format}"]
    end
  end
end
