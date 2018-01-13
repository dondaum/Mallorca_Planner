web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -e production -q mailer -C config/sidekiq.yml
