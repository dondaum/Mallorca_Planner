require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MallorcaPlanner
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :de
    
    # using sidekiq for background processing in combination with active job
    config.active_job.queue_adapter = :sidekiq

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      if html_tag =~ /<(input|label|textarea|select)/
        html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
        html_field.children.add_class 'invalid'
        html_field.to_s.html_safe
     else
       html_tag
     end
    }


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
